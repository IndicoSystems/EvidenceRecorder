import Foundation
import SwiftUI
import SwiftKeychainWrapper

public typealias Email = String
public typealias MimeType = String
public typealias LongString = String
public typealias ShortString = String
public typealias ShortReqString = String
public typealias Longitude = Double
public typealias Latitude = Double
public typealias PositiveInt = Int
public typealias PositiveNonZeroInt = Int
public typealias DateTime = String
public typealias Json = [String : Any?]

class CloudClient: ObservableObject {
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Endpoint: String {
        case api = "api/"
        case auth = "auth/"
    }
    
    static let shared = CloudClient()
    
    @Published var forms = [ERForm]()
    @Published var rooms = [Room]()
    @Published var cameras = [Camera]()
    @Published var projects = [Project]()
    
    @Published var isSignedOut = true
    
    private init() {
        authenticate()
    }
    
    private func phpRequest(method: HTTPMethod, endpoint: Endpoint, payload: [String : Any]? = nil, completion: @escaping (Result<FT4Response, Error>)->()) {
        let host = UserDefaults.standard.string(forKey: "host")!
        let url = URL(string: "https://\(host)/")!
        var request = URLRequest(url: url.appendingPathComponent(endpoint.rawValue))
        request.httpMethod = method.rawValue
        
        if let token = UserDefaults.standard.string(forKey: "token") {
            request.allHTTPHeaderFields = ["indico-access-token" : token]
        }
        
        switch method {
        case .post:
            if let payload = payload {
                let json = try! JSONSerialization.data(withJSONObject: payload)
                request.httpBody = json
            }
        default:
            break
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let err = error {
                print(err.localizedDescription)
//                completion((0, err.localizedDescription.data(using: .utf8)!))
                let ft4Response = FT4Response(statusCode: 0, body: err.localizedDescription.data(using: .utf8)!)
                completion(.success(ft4Response))
            }
            
            var statusCode = 0
            
            if let response = response as? HTTPURLResponse {
                statusCode = response.statusCode
            }
            
            if let d = data {
                let ft4Response = FT4Response(statusCode: statusCode, body: d)
                completion(.success(ft4Response))
            }
        }.resume()
    }
    
    func getCameras() {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_cameras"]) { result in
            switch result {
            case .success(let ft4Response):
                
                do {
                    let cams = try JSONDecoder().decode([Axis].self, from: ft4Response.body)
                    DispatchQueue.main.async {
                        self.cameras = cams
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getRooms() {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_rooms"]) { result in
            switch result {
            case .success(let ft4Response):
                let rooms = try! JSONDecoder().decode([Room].self, from: ft4Response.body)
                DispatchQueue.main.async {
                    self.rooms = rooms
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getCases() {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_projects"]) { result in
            switch result {
            case .success(let ft4Response):
                print(ft4Response.statusCode)
                
                let projects = try! JSONDecoder().decode([Project].self, from: ft4Response.body)
                DispatchQueue.main.async {
                    self.projects = projects
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func signIn(username: String, password: String) {
        phpRequest(method: .post, endpoint: .auth, payload: ["action" : "sign_in", "username" : username, "password" : password]) { result in
            switch result {
            case .success(let ft4Response):
                let json = try! JSONSerialization.jsonObject(with: ft4Response.body) as! [String : Any]
                guard let token = json["access_token"] as? String else { return }
                UserDefaults.standard.setValue(token, forKey: "token")
                
                self.getRooms()
                self.getCameras()
                
                DispatchQueue.main.async {
                    self.isSignedOut = false
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func signOut() {
        
        phpRequest(method: .post, endpoint: .auth, payload: ["action" : "sign_out"]) { result in
            switch result {
            case .success(let ft4Response):
                switch ft4Response.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        self.isSignedOut = true
                    }
                    
                    UserDefaults.standard.setValue(nil, forKey: "token")
                default:
                    break
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func authenticate() {
        guard let _ = UserDefaults.standard.string(forKey: "token") else {
            return
        }
        
        isSignedOut = false
        
        getRooms()
        getCameras()
        getCases()
    }
    
    func getForms() {
//        apolloClient.fetch(query: GetFormsQuery(), cachePolicy: .default, contextIdentifier: nil, queue: .main) { result in
//            switch result {
//            case .success(let data):
//                self.forms.removeAll()
//
//                guard let d = data.data,
//                      let capture = d.settings.capture,
//                      let requiredForms = capture.requiredForms else { return }
//
//                for form in requiredForms.forms {
//
//                    let erForm = ERForm(form: form)
//                    self.forms.append(erForm)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
    }
    
    func createFile(with clientMediaId: String, size: Int, completion: @escaping (Result<String, Error>) -> ()) {
        
//        let fileCreateInput = FileCreateInput(clientMediaId: clientMediaId, fileSize: PositiveNonZeroInt(size), captureStartedAt: Date().iso8601, mime: "video/x-matroska")
//        apolloClient.perform(mutation: CreateFileMutation(data: fileCreateInput)) { result in
//            switch result {
//            case .success(let data):
//
//                if let errors = data.errors, let error = errors.first {
//                    completion(.failure(error))
//                    return
//                }
//
//                guard let d = data.data else {
//                    print("No data!")
//                    return
//                }
//                completion(.success(d.createFile.uploadPath))
//
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
    }
    
    func createExhibit() {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "create_exhibit", "id" : UUID().uuidString]) { result in
            switch result {
            case .success(let ft4Response):
                print(ft4Response.statusCode)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
//
//    func createApolloClient(withBearerToken bearerToken: String) {
//        
//        let authPayload = [
//            "Authorization" : "Bearer \(bearerToken)",
//            "client-version" : "\(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "-")"
//        ]
//        
//        let host = UserDefaults.standard.string(forKey: "host") ?? ""
//        
//        let sessionConfiguration = URLSessionConfiguration.default
//        sessionConfiguration.httpAdditionalHeaders = authPayload
//        let urlSessionClient = URLSessionClient(sessionConfiguration: sessionConfiguration, callbackQueue: nil)
//        let interceptorProvidor = LegacyInterceptorProvider(client: urlSessionClient, shouldInvalidateClientOnDeinit: true, store: apolloStore)
//        let networkTransport = RequestChainNetworkTransport(interceptorProvider: interceptorProvidor, endpointURL: URL(string: "https://\(host)/papi/")!)
//        let apolloClient = ApolloClient(networkTransport: networkTransport, store: apolloStore)
//        
//        self.apolloClient = apolloClient
//        
//    }
}

extension Date {
    var iso8601: String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [ISO8601DateFormatter.Options.withInternetDateTime, ISO8601DateFormatter.Options.withFractionalSeconds]
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.string(from: self)
    }
}

struct FT4Response {
    let statusCode: Int
    let body: Data
}
