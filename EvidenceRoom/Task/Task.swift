import Foundation

struct Task: Codable {
    let id: String
    let template: Bool
    let complete: Bool
    let entity: TaskEntity?
    let entityId: String?
    let name: [String : String]
    let projectId: String?
    let projectName: String?
    let dueAt: String?
    let fields: [TaskField]
    
    var date: Date {
        let dateFormatter = DateFormatter()
        guard let dueAt = dueAt else { return Date.distantFuture }
        return dateFormatter.date(from: dueAt) ?? Date.distantPast
    }
    
    enum CodingKeys: String, CodingKey {
        case id, template, complete, entity, name, fields
        case entityId = "entity_id"
        case projectId = "project_id"
        case projectName = "project_name"
        case dueAt = "due_at"
    }
}

enum TaskEntity: String, Codable {
    case person
}
