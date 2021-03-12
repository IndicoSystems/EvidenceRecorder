import Foundation

protocol Camera {
    var id: String { get }
    var name: String { get }
    var address: String { get }
    var url: URL { get }
    var serverURL: URL { get }
    var streamURL: URL { get }
    var isRecording: Bool { get }
    
    func startRecording(completion: @escaping (Result<Bool, Error>) -> ())
    func stopRecording(completion: @escaping (Result<RecordingInfo, Error>) -> ())
    
    func upload(file: File)
    func getUploadURL(recordingInfo: RecordingInfo)
}

extension Camera {
    var url: URL {
        let ip = address.split(separator: ":").first!
        return URL(string: "http://\(ip)")!
    }
    
    var serverURL: URL {
        return URL(string: "http://\(address)")!
    }
    
    var streamURL: URL {
        return serverURL.appendingPathComponent("feed")
    }
}

extension Camera {
    func startRecording(completion: @escaping (Result<Bool, Error>) -> ()) {
        var request = URLRequest(url: serverURL.appendingPathComponent("record/start"))
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let err = error {
                completion(.failure(err))
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200:
                    completion(.success(true))
                case 208:
                    completion(.success(false))
                case 404:
                    completion(.failure(CameraNetworkingClientError.notFound404))
                default:
                    completion(.failure(CameraNetworkingClientError.unknownError))
                }
            }
        }.resume()
    }
    
    func stopRecording(completion: @escaping (Result<RecordingInfo, Error>) -> ()) {
        var request = URLRequest(url: serverURL.appendingPathComponent("record/stop"))
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let err = error {
                completion(.failure(err))
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200:
                    if let data = data {
                        do {
                            let recordingInfo = try JSONDecoder().decode(RecordingInfo.self, from: data)
                            completion(.success(recordingInfo))
                        } catch {
                            completion(.failure(error))
                        }
                    }
                case 208:
                    print("Already sent")
                case 400...500:
                    print("Error:", response.statusCode)
                default:
                    print("Error:", response.statusCode)
                }
            }
        }.resume()
    }
}

extension Camera {
    func getUploadURL(recordingInfo: RecordingInfo) {

        DispatchQueue.global().async {
            AuthClient.shared.authenticate()

            DispatchQueue.main.async {
                CloudClient.shared.createFile(with: recordingInfo.id, size: recordingInfo.fileSize) { result in
                    switch result {
                    case .success(let url):
                        let file = File(location: url, id: recordingInfo.id)
                        upload(file: file)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func upload(file: File) {
        var request = URLRequest(url: serverURL.appendingPathComponent("file"))
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type" : "application/json-header"
        ]

        let fileData = try! JSONEncoder().encode(file)
        request.httpBody = fileData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let err = error  {
                print(err.localizedDescription)
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print(String(data: data!, encoding: .utf8) ?? "No data")
                } else {
                    print("ERROR! \(response.statusCode)")
                }
            }
        }.resume()
    }
}

//class Camera {
//
//    let id: String
//    let name: String
//    let address: String
//
//    var url: URL {
//        let ip = address.split(separator: ":").first!
//        return URL(string: "http://\(ip)")!
//    }
//
//    var serverURL: URL {
//        return URL(string: "http://\(address)")!
//    }
//
//    init(apolloCam: GetRoomsQuery.Data.Room.Camera) {
//        self.id = apolloCam.id
//        self.name = apolloCam.name
//        self.address = apolloCam.address
//    }
//
//    var streamURL: URL {
//        return serverURL.appendingPathComponent("feed")
//    }
//}
//
//class AxisCamera: Camera {
//
//    enum Request: String {
//        case start = "/record/start"
//        case stop  = "/record/stop"
//    }
//
//    var stream: URL {
//        return URL(string: "rtsp://\(address)/axis-media/media.amp")!
//    }
//}
