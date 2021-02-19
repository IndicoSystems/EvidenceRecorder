import Foundation

struct File: Codable {
    let location: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case location = "url"
        case id = "id"
    }
}
