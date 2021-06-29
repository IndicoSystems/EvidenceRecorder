import Foundation

struct Room: Codable {
    let id: String
    let name: String
    
    var cameras: [Camera] {
//        devices.filter({ $0 is Camera })
        devices.compactMap({ $0 as? Camera })
    }
    
    var devices: [Device] {
        AppState.shared.devices.filter({ id == $0.roomId })
    }
}
