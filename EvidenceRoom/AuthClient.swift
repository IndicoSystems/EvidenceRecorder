import Foundation
import OAuthSwift
import AuthenticationServices
import Apollo
import SwiftKeychainWrapper

class AuthClient: NSObject, ObservableObject {
    
    static let shared = AuthClient()
    
    enum AuthError: Error {
        case fetchEndpointsError
        case parseEndpointsError
        
        var errorDescription: String? {
            switch self {
            case .fetchEndpointsError:
                return NSLocalizedString("Error fetching from endpoints", comment: "")
            case .parseEndpointsError:
                return NSLocalizedString("Could not parse endpoints JSON", comment: "")
            }
        }
    }
    
    @Published var isSignedOut = false
    
    var oauthswift: OAuth2Swift?
    
    let clientId = "test-evidenceroom"
    let clientSecret = "c887b8e7bfa14e649353b360d4fc1895"
    let redirectURL = "indicoevidenceroom"
    
    var wellknown: Wellknown?
    
    var host = ""
    
    private override init() {
        super.init()
        
        host = UserDefaults.standard.string(forKey: "host") ?? ""
        if host.isEmpty {
            isSignedOut = true
        } else {
            authenticate()
        }
    }
    
    func fetchEndpoints(fromHost host: String, completionHandler: @escaping(Result<Wellknown, AuthError>)->()) {
        guard let url = URL(string: "https://" + host + "/endpoints") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completionHandler(.failure(.fetchEndpointsError))
            }
            
            if let resp = response {
                print(resp)
            }
            
            if let data = data {
                do {
                    let endpoint = try JSONDecoder().decode(Endpoint.self, from: data)
                    
                    self.wellknown = endpoint.auth.wellknown
                    
                    DispatchQueue.main.async {
                        self.isSignedOut = false
                    }
                    completionHandler(.success(endpoint.auth.wellknown))
                } catch {
                    print(error.localizedDescription)
                    completionHandler(.failure(.parseEndpointsError))
                }
            }
            
        }.resume()
    }
    
    func signIn(withHost host: String) {
        
        fetchEndpoints(fromHost: host) { result in
            switch result {
            case .success(let wellknown):
                
                guard let authURL = URL(string: wellknown.authorizationEndpoint), let tokenURL = URL(string: wellknown.tokenEndpoint) else { return }
                
                self.oauthswift = OAuth2Swift(consumerKey: self.clientId, consumerSecret: self.clientSecret, authorizeUrl: authURL, accessTokenUrl: tokenURL, responseType: "code")
                
                guard let oauth = self.oauthswift else { return }
                
                DispatchQueue.main.async {
                    oauth.authorizeURLHandler = ASWebAuthenticationURLHandler(callbackUrlScheme: self.redirectURL, presentationContextProvider: self)
                    
                    let _ = oauth.authorize(withCallbackURL: URL(string: self.redirectURL + "://auth")!, scope: "openid offline_access papi_access", state: "indico") { result in
                        
                        switch result {
                        case .success(let (credential, _, parameters)):
                            CloudClient.shared.createApolloClient()
                            KeychainWrapper.standard.set(credential.oauthToken, forKey: "oauthToken")
                            KeychainWrapper.standard.set(credential.oauthRefreshToken, forKey: "refreshToken")
                            print("Credential: \(credential.oauthToken)")
                            
                            UserDefaults.standard.setValue(host, forKey: "host")
                            
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func authenticate() {
        
        fetchEndpoints(fromHost: host) { result in
            switch result {
            case .success(let wellknown):
                self.wellknown = wellknown
                self.oauthswift = OAuth2Swift(consumerKey: self.clientId, consumerSecret: self.clientSecret, authorizeUrl: wellknown.authorizationEndpoint, accessTokenUrl: wellknown.tokenEndpoint, responseType: "", contentType: nil)
                
                guard let oauth = self.oauthswift else { return }
                let refreshToken = KeychainWrapper.standard.string(forKey: "refreshToken")!
                
                
                oauth.renewAccessToken(withRefreshToken: refreshToken) { result in
                    switch result {
                    case .success(let success):
                        print("AuthToken is expired: \(success.credential.isTokenExpired())")
                        print("AuthToken will expire: \(success.credential.oauthTokenExpiresAt)")
                        KeychainWrapper.standard.set(success.credential.oauthRefreshToken, forKey: "refreshToken")
                    case .failure(let error):
                        print(error)
                    }
                }
                
                CloudClient.shared.createApolloClient()
                
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }                   
        
    }
}

extension AuthClient: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return UIApplication.shared.windows.filter({$0.isKeyWindow}).first!
    }
}
