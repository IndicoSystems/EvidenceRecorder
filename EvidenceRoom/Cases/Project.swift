import Foundation

enum Permission: String, CaseIterable, Codable {
    case all
    case read
    case write
    case visible
}

struct Project: Codable {
    let id: String
    let name: String
    let permission: Permission
}
