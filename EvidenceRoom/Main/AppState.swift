import SwiftUI

class AppState: ObservableObject {
    static let shared = AppState()
    
    @Published var rooms = [Room]()
    @Published var cameras = [Camera]()
    @Published var projects = [Project]()
    @Published var tasks = [Task]()
    @Published var templates = [Task]()
    @Published var isSignedOut = true
    
    var assignedRoom: Room? {
        let assignedRoomId = UserDefaults.standard.string(forKey: "assignedRoomId")
        return rooms.first(where: {$0.id == assignedRoomId })
    }
    
    private init() {}
}
