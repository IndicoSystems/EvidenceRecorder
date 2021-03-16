import Foundation

protocol Uploader {
    func upload(file: File)
    
    func getUploadURL(recordingInfo: RecordingInfo)
}

extension Uploader {
    func getUploadURL(recordingInfo: RecordingInfo) {
        
//        DispatchQueue.global().async {
//            AuthClient.shared.authenticate()
//            
//            DispatchQueue.main.async {
//                CloudClient.shared.createFile(with: recordingInfo.id, size: recordingInfo.fileSize) { result in
//                    switch result {
//                    case .success(let url):
//                        let file = File(location: url, id: recordingInfo.id)
//                        upload(file: file)
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//                }
//            }
//        }
    }
}
