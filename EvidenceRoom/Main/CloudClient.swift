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
    
    static let shared = CloudClient()
    
    var apolloClient: ApolloClient!
    
    private let apolloStore = ApolloStore()
    
    @Published var forms = [String]()
    
    func fetchCameras(from url: URL, completion: @escaping (Result<[AxisCamera], Error>) -> ()) {
        var cameras = [AxisCamera]()
//        let camera1 = AxisCamera(ip: "10.0.0.83", port: 8089, name: "Cam 1")
        let camera2 = AxisCamera(ip: "192.168.1.85", port: 8089, name: "Cam 2")
        
        cameras = [
//            camera1,
            camera2
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
    
    func getForms() {
        apolloClient.fetch(query: GetFormsQuery(), cachePolicy: .default, contextIdentifier: nil, queue: .main) { result in
            switch result {
            case .success(let data):
                self.forms.removeAll()
                
                guard let d = data.data,
                      let capture = d.settings.capture,
                      let requiredForms = capture.requiredForms else { return }
                
                for form in requiredForms.forms {
                    
                    let name = form.formType.displayName.first!.value as! String
                    self.forms.append(name)
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
