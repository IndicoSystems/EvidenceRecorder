import Foundation

struct MockCamera: Camera {
    let id = "mock123"
    let name = "Mock"
    let address = "localhost:8089"
    
    var isRecording: Bool { return false }
}
