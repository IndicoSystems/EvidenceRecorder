import Foundation

struct RecordingResponse: Codable {
    let id: String
    let recordingInfo: RecordingInfo
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case recordingInfo = "RecordingInfo"
    }
}

struct RecordingInfo: Codable {
    let id: String
    let fileSize: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case fileSize = "file_size"
    }
}
