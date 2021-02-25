import Foundation

struct Room {
    let id: String
    let name: String
    let cameras: [Camera]
    
    init(apolloRoom: GetRoomsQuery.Data.Room) {
        self.id = apolloRoom.id
        self.name = apolloRoom.name
        
        var cams = [Camera]()
        apolloRoom.cameras?.forEach({
                        
            switch $0.__typename {
            case "Axis":
                let camera = Axis(apolloCam: $0)
                cams.append(camera)
            default:
                break
            }
        })
        self.cameras = cams
    }
}

protocol Camera {
    var id: String { get }
    var name: String { get }
    var address: String { get }
    var url: URL { get }
    var serverURL: URL { get }
    var streamURL: URL { get }
    
    func startRecording(completion: @escaping (Result<Bool, Error>) -> ())
    func stopRecording(completion: @escaping (Result<RecordingInfo, Error>) -> ())
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
                    break
                }
            }
        }.resume()
    }
}

struct Axis: Camera, Uploader {
    var id: String
    var name: String
    var address: String
    
    init(apolloCam: GetRoomsQuery.Data.Room.Camera) {
        self.id = apolloCam.id
        self.name = apolloCam.name
        self.address = apolloCam.address
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
