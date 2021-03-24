import Foundation

struct TaskField: Codable {
    let id: String
    let title: String
    let placeholder: String
    let description: String
    let required: String
    let type: String
    let answer: String?
    let exhibits: [Exhibit]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case placeholder = "placeholder"
        case description = "description"
        case required = "required"
        case type = "type"
        case answer = "answer"
        case exhibits = "exhibits"
    }
}

struct Language: Codable {
    let key: String
    let value: String
}
