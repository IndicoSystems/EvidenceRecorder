import Foundation

struct Axis: Camera {
    var id: String
    var name: String
    var address: String
    var isRecording: Bool { return false }
    
    init(apolloCam: GetRoomsQuery.Data.Room.Camera) {
        self.id = apolloCam.id
        self.name = apolloCam.name
        self.address = apolloCam.address
    }
}
