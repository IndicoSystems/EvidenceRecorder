import Foundation

struct MockCamera: Camera {
    let id = "mock123"
    let name = "Mock"
    let address = "localhost:8089"
}

extension MockCamera: Uploader {
    func upload(file: File) {
        print("File with ID \(file.id) is uploading ...")
    }
}
