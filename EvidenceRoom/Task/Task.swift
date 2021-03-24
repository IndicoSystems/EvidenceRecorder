import Foundation

struct Task: Codable {
    let id: String
    let name: String
    let projectId: String?
    let projectName: String?
    let dueAt: String?
    let fields: [TaskField]?
    
    var date: Date {
        let dateFormatter = DateFormatter()
        guard let dueAt = dueAt else { return Date.distantFuture }
        return dateFormatter.date(from: dueAt) ?? Date.distantPast
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case projectId = "project_id"
        case projectName = "project_name"
        case dueAt = "due_at"
        case fields = "fields"
    }
}
