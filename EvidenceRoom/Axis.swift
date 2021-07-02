import Foundation

class Axis: Camera, Codable {
        
    let id: String
    let roomId: String?
    let name: String
    let address: String?
    var isRecording = false
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        roomId = try container.decode(String?.self, forKey: .roomId)
        name = try container.decode(String.self, forKey: .name)
        address = try container.decode(String.self, forKey: .address)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case roomId = "room_id"
        case name = "name"
        case address = "address"
    }
}
