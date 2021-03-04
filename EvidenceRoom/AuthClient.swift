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
    
    let clientId = "evidencerecorder"
    let clientSecret = "c887b8e7bfa14e649353b360d4fc1895"
    let redirectURL = "indicoevidencerecorder"
    
    var wellknown: Wellknown!
    
    private let keychain = KeychainWrapper.standard
    private let userDefaults = UserDefaults.standard
    
    var accessToken: String? {
        #if targetEnvironment(macCatalyst)
        return UserDefaults.standard.string(forKey: "oauthToken")
        #else
        return KeychainWrapper.standard.string(forKey: "oauthToken")
        #endif
    }
    
    var refreshToken: String? {
        #if targetEnvironment(macCatalyst)
        return UserDefaults.standard.string(forKey: "refreshToken")!
        #else
        return KeychainWrapper.standard.string(forKey: "refreshToken")!
        #endif
    }
    
    var host = ""
    
    private override init() {
        super.init()
        
        host = UserDefaults.standard.string(forKey: "host") ?? ""
        if host.isEmpty {
            isSignedOut = true
        } else {
            
            fetchEndpoints(fromHost: host) { result in
                self.authenticate()
            }
            
//            #if targetEnvironment(macCatalyst)
//            if UserDefaults.standard.string(forKey: "refreshToken") == nil {
//                isSignedOut = true
//            } else {
//                authenticate()
//            }
//            #else
//            if KeychainWrapper.standard.string(forKey: "refreshToken") == nil {
//                isSignedOut = true
//            } else {
//                authenticate()
//            }
//            #endif
            
            
        }
    }
    
    func fetchEndpoints(fromHost host: String, completionHandler: @escaping(Result<Wellknown, AuthError>)->()) {
        guard let url = URL(string: "https://" + host + "/endpoints") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completionHandler(.failure(.fetchEndpointsError))
            }
            
            if let resp = response as? HTTPURLResponse {
                switch resp.statusCode {
                case 400...999:
                    print(resp.statusCode)
                    completionHandler(.failure(.fetchEndpointsError))
                    return
                default:
                    break
                }
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

                            UserDefaults.standard.setValue(host, forKey: "host")
                            
                            #if targetEnvironment(macCatalyst)
                            self.userDefaults.setValue(credential.oauthToken, forKey: "oauthToken")
                            self.userDefaults.setValue(credential.oauthRefreshToken, forKey: "refreshToken")
                            #else
                            self.keychain.set(credential.oauthToken, forKey: "oauthToken")
                            self.keychain.set(credential.oauthRefreshToken, forKey: "refreshToken")
                            #endif
                            
                            CloudClient.shared.createApolloClient(withBearerToken: credential.oauthToken)
                            CloudClient.shared.getForms()
                            CloudClient.shared.getRooms()
                            
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
        
//        fetchEndpoints(fromHost: host) { result in
//            switch result {
//            case .success(let wellknown):
//                self.wellknown = wellknown
        
        if !isAccessTokenExpired() {
            return
        }
        
        self.oauthswift = OAuth2Swift(consumerKey: self.clientId, consumerSecret: self.clientSecret, authorizeUrl: self.wellknown.authorizationEndpoint, accessTokenUrl: self.wellknown.tokenEndpoint, responseType: "code")
        
        guard let oauth = self.oauthswift else { return }
        guard let refreshToken = self.refreshToken else { return }
        
        oauth.renewAccessToken(withRefreshToken: refreshToken) { [unowned self] result in
            switch result {
            case .success(let success):
                #if targetEnvironment(macCatalyst)
                self.userDefaults.setValue(success.credential.oauthRefreshToken, forKey: "refreshToken")
                self.userDefaults.setValue(success.credential.oauthToken, forKey: "oauthToken")
                
                #else
                self.keychain.set(success.credential.oauthRefreshToken, forKey: "refreshToken")
                self.keychain.set(success.credential.oauthToken, forKey: "oauthToken")
                #endif
                
                CloudClient.shared.createApolloClient(withBearerToken: success.credential.oauthToken)
                CloudClient.shared.getForms()
                CloudClient.shared.getRooms()
            
            case .failure(let error):
                print(error)
            }
        }
        
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //                break
        //            }
        //        }
    }
    
    func signOut() {
        keychain.set("", forKey: "refreshToken")
        keychain.set("", forKey: "oauthToken")
        isSignedOut = true
    }
    
    func isAccessTokenExpired() -> Bool {
        
        guard let oauth = self.oauthswift else { return true }
        
        return oauth.client.credential.isTokenExpired()
    }
}

extension AuthClient: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return UIApplication.shared.windows.filter({$0.isKeyWindow}).first!
    }
}
