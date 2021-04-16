import Foundation

struct Room: Codable {
    let id: String
    let name: String
    
    var cameras: [Camera] {
        AppState.shared.cameras.filter({ id == $0.roomId })
    }
}
