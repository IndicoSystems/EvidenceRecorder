import Foundation

struct Axis: Camera, Uploader {
    var id: String
    var name: String
    var address: String
    
    init(apolloCam: GetRoomsQuery.Data.Room.Camera) {
        self.id = apolloCam.id
        self.name = apolloCam.name
        self.address = apolloCam.address
    }
}
