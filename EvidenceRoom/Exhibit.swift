import Foundation

struct Exhibit: Codable {
    let id: String
    let startedAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case startedAt = "started_at"
    }
}
