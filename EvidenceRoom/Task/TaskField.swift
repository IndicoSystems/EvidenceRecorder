import Foundation

struct TaskField: Codable {
    
    let id: String
    let entityField: String?
    let title: String
    let placeholder: String
    let description: String
    let required: String
    let type: TaskFieldType
    let answer: String?
    let subTasks: [Task]?
    let exhibits: [Exhibit]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case entityField = "entity_field"
        case title = "title"
        case placeholder = "placeholder"
        case description = "description"
        case required = "required"
        case type = "type"
        case answer = "answer"
        case subTasks = "subtasks"
        case exhibits = "exhibits"
    }
}

struct Language: Codable {
    let key: String
    let value: String
}

enum TaskFieldType: String, Codable {
    case person, text, capture, subtask
}
