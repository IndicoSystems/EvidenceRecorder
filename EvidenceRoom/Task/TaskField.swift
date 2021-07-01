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
    let features: [String]
    let answer: String?
    let exhibits: [Exhibit]
    let subtasks: [Task]
    let options: [ChoiceOption]
    
    enum CodingKeys: String, CodingKey {
        case id, title, placeholder, description, required, type, answer, exhibits, min, max, features, subtasks, options
        case entityField = "entity_field"
    }
}

enum TaskFieldType: String, Codable {
    case text, subtask, number, file, time, choice, layout
}

class ChoiceOption: Codable, Identifiable {
    let title: [String:String]?
    let value: String
    var answer: Bool
    
    var id: UUID {
        UUID()
    }
}

struct Language: Codable {
    let key: String
    let value: String
}


