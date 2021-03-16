import Foundation

struct Axis: Camera, Codable {
    let id: String
    let roomId: String?
    let name: String
    let address: String
    var isRecording: Bool { return false }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case roomId = "room_id"
        case name = "name"
        case address = "address"
    }
}
