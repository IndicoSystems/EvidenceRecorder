import Foundation

struct Room: Codable {
    let id: String
    let name: String
    
    var cameras: [Camera] {
        CloudClient.shared.cameras.filter({ id == $0.roomId })
    }
    
    func startAllCameras() {
        for camera in cameras {
            camera.startRecording { result in
                switch result {
                case .success(let success):
                    if success {
                        print("\(camera.name) started")
                    } else {
                        print("\(camera.name) is already recording")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func stopAllCameras() {
        for camera in cameras {
            camera.stopRecording { result in
                switch result {
                case .success(let recordingInfo):
                    print(recordingInfo.fileSize)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
