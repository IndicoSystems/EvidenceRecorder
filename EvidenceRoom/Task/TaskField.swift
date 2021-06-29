import Foundation

struct TaskField: Codable {
    
    let id: String
    let entityField: String?
    let title: [String : String]?
    let placeholder: [String : String]?
    let description: [String : String]?
    let required: Bool
    let type: TaskFieldType
    let min: Int?
    let max: Int?
    let answer: String?
    let exhibits: [Exhibit]
    let subtasks: [Task]
    
    enum CodingKeys: String, CodingKey {
        case id, title, placeholder, description, required, type, answer, exhibits, min, max, subtasks
        case entityField = "entity_field"
    }
}

//enum TaskFieldType: String, Codable {
//    case person, text, capture, subtask
//}

enum TaskFieldType: String, Codable {
    case text, subtask, number, file, time, choice, layout
}

struct Language: Codable {
    let key: String
    let value: String
}


