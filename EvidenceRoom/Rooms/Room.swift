import Foundation

struct Room {
    let id: String
    let name: String
    let cameras: [Camera]
    
    init(apolloRoom: GetRoomsQuery.Data.Room) {
        self.id = apolloRoom.id
        self.name = apolloRoom.name
        
        var cams = [Camera]()
        apolloRoom.cameras?.forEach({
                        
            switch $0.__typename {
            case "Axis":
                let camera = Axis(apolloCam: $0)
                cams.append(camera)
            default:
                break
            }
        })
        self.cameras = cams
    }
}
