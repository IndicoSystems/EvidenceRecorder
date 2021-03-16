import Foundation
import SwiftUI
import Apollo
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
    
    var apolloClient: ApolloClient!
    
    private let apolloStore = ApolloStore()
    
    @Published var forms = [ERForm]()
    @Published var rooms = [Room]()
    @Published var cameras = [Camera]()
    @Published var cases = [ERCase]()
    
    func fetchCameras(from url: URL, completion: @escaping (Result<[Camera], Error>) -> ()) {
        var cameras = [Camera]()
//        let camera1 = AxisCamera(ip: "10.0.0.83", port: 8089, name: "Cam 1")
//        let camera2 = AxisCamera(ip: "192.168.1.85", port: 8089, name: "Cam 2")
        
        cameras = [
//            camera1,
//            camera2
        ]
        
        completion(.success(cameras))
        
//        let request = URLRequest(url: url)
//
//        let _ = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let err = error {
//                let camera1 = AxisCamera(ip: "192.168.1.50", port: 8089, name: "Cam 1")
//                let camera2 = AxisCamera(ip: "192.168.1.85", port: 8089, name: "Cam 2")
//                cameras = [camera1, camera2]
//                completion(.success(cameras))
//            }
//
//            guard let data = data else { return }
//
//            do {
//                let rooms = try JSONDecoder().decode([Room].self, from: data)
//
//                for room in rooms {
//                    for camera in room.cameras {
//                        let cam = AxisCamera(ip: camera.ip, port: camera.port, name: camera.name)
//                        cameras.append(cam)
//                    }
//                    completion(.success(cameras))
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }.resume()
    }
    
    func getCases() {
        apolloClient.fetch(query: GetCasesQuery(), cachePolicy: .default, contextIdentifier: nil, queue: .main) { result in
            switch result {
            case .success(let data):
                guard let d = data.data else { return }
                
                var cases = [ERCase]()
                d.cases.forEach({
                    cases.append(ERCase(papiCase: $0))
                })
                self.cases = cases
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    private func phpRequest(method: HTTPMethod, endpoint: Endpoint, payload: [String : Any]? = nil, completion: @escaping ((Int, Data))->()) {
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
                completion((0, err.localizedDescription.data(using: .utf8)!))
            }
            
            var statusCode = 0
            
            if let response = response as? HTTPURLResponse {
                statusCode = response.statusCode
            }
            
            var result = (statusCode, Data())
            
            if let d = data {
                result.1 = d
                completion(result)
            }
        }.resume()
    }
    
    func getCameras() {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_cameras"]) { data in
            let cams = try! JSONDecoder().decode([Axis].self, from: data.1)
            self.cameras = cams
        }
    }
    
    func getRooms() {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_rooms"]) { data in
            let rooms = try! JSONDecoder().decode([Room].self, from: data.1)
            self.rooms = rooms
        }
    }
    
    func signIn(username: String, password: String) {
        phpRequest(method: .post, endpoint: .auth, payload: ["action" : "sign_in", "username" : username, "password" : password]) { data in
            print(String(data: data.1, encoding: .utf8)!)
            let json = try! JSONSerialization.jsonObject(with: data.1) as! [String : Any]
            guard let token = json["access_token"] as? String else { return }
            UserDefaults.standard.setValue(token, forKey: "token")
        }
    }
    
    func getForms() {
        apolloClient.fetch(query: GetFormsQuery(), cachePolicy: .default, contextIdentifier: nil, queue: .main) { result in
            switch result {
            case .success(let data):
                self.forms.removeAll()
                
                guard let d = data.data,
                      let capture = d.settings.capture,
                      let requiredForms = capture.requiredForms else { return }
                
                for form in requiredForms.forms {
                    
                    let erForm = ERForm(form: form)
                    self.forms.append(erForm)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func createFile(with clientMediaId: String, size: Int, completion: @escaping (Result<String, Error>) -> ()) {
        
        let fileCreateInput = FileCreateInput(clientMediaId: clientMediaId, fileSize: PositiveNonZeroInt(size), captureStartedAt: Date().iso8601, mime: "video/x-matroska")
        apolloClient.perform(mutation: CreateFileMutation(data: fileCreateInput)) { result in
            switch result {
            case .success(let data):
                
                if let errors = data.errors, let error = errors.first {
                    completion(.failure(error))
                    return
                }
                
                guard let d = data.data else {
                    print("No data!")
                    return
                }
                completion(.success(d.createFile.uploadPath))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func createApolloClient(withBearerToken bearerToken: String) {
        
        let authPayload = [
            "Authorization" : "Bearer \(bearerToken)",
            "client-version" : "\(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "-")"
        ]
        
        let host = UserDefaults.standard.string(forKey: "host") ?? ""
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = authPayload
        let urlSessionClient = URLSessionClient(sessionConfiguration: sessionConfiguration, callbackQueue: nil)
        let interceptorProvidor = LegacyInterceptorProvider(client: urlSessionClient, shouldInvalidateClientOnDeinit: true, store: apolloStore)
        let networkTransport = RequestChainNetworkTransport(interceptorProvider: interceptorProvidor, endpointURL: URL(string: "https://\(host)/papi/")!)
        let apolloClient = ApolloClient(networkTransport: networkTransport, store: apolloStore)
        
        self.apolloClient = apolloClient
        
    }
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
    let body: String
}
