import Foundation

enum CameraNetworkingClientError: Error {
    case notFound404
    case unknownError
}

class CameraNetworkingClient {
    
    let localURL = URL(string: "http://10.0.0.25:8089")!
    
    func startRecording(camera: Camera, completion: @escaping (Result<Bool, Error>) -> ()) {
        var request = URLRequest(url: localURL.appendingPathComponent("record/start"))
//        var request = URLRequest(url: camera.serverURL.appendingPathComponent("record/start"))
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
    
    func stopRecording(camera: Camera, completion: @escaping (Result<RecordingInfo, Error>) -> ()) {
        var request = URLRequest(url: localURL.appendingPathComponent("record/stop"))
//        var request = URLRequest(url: camera.serverURL.appendingPathComponent("record/stop"))
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
    
    func upload(file: File, from camera: Camera) {
        var request = URLRequest(url: localURL.appendingPathComponent("file"))
//        var request = URLRequest(url: camera.serverURL.appendingPathComponent("upload"))
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
                    print(String(data: data!, encoding: .utf8))
                } else {
                    print("ERROR! \(response.statusCode)")
                }
            }
        }.resume()
    }
}
