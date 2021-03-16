import Foundation

struct MockCamera: Camera {    
    let id = "mock123"
    let roomId: String? = "asdfa32sd1-321ad-321dfgs-adf"
    let name = "Mock"
    let address = "localhost:8089"
    
    var isRecording: Bool { return false }
}
