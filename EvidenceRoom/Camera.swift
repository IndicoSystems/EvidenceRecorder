import Foundation

protocol Camera: Device {
    var serverURL: URL? { get }
    var streamURL: URL? { get }
    var isRecording: Bool { get set }
    
    func startRecording(fieldId: String, completion: @escaping (Result<Bool, Error>) -> ())
    func stopRecording(completion: @escaping (Result<RecordingInfo, Error>) -> ())
    
    func upload(file: File)
}

extension Camera {
    
    var serverURL: URL? {
        return URL(string: "http://\(address ?? "")")
    }
    
    var streamURL: URL? {
        return serverURL?.appendingPathComponent(CameraCommand.feed)
    }
}

extension Camera {
    func startRecording(fieldId: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        var request = URLRequest(url: serverURL!.appendingPathComponent(CameraCommand.startRecording))
        request.httpMethod = HTTPMethod.post
        
        let payload = ["taskFieldId" : fieldId]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: payload, options: .fragmentsAllowed)
        request.httpBody = jsonData
        
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
        var request = URLRequest(url: serverURL!.appendingPathComponent(CameraCommand.stopRecording))
        request.httpMethod = HTTPMethod.post
        
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
    
    func upload(file: File) {
        var request = URLRequest(url: serverURL!.appendingPathComponent(CameraCommand.upload))
        request.httpMethod = HTTPMethod.post
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
