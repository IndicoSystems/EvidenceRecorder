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
            let camera = Camera(apolloCam: $0)
            cams.append(camera)
        })
        self.cameras = cams
    }
}

class Camera {
    
    let id: String
    let name: String
    let address: String
    
    var url: URL {
        let ip = address.split(separator: ":").first!
        return URL(string: "http://\(ip)")!
    }
    
    var serverURL: URL {
        return URL(string: "http://\(address)")!
    }
    
    init(apolloCam: GetRoomsQuery.Data.Room.Camera) {
        self.id = apolloCam.id
        self.name = apolloCam.name
        self.address = apolloCam.address
    }
    
    var streamURL: URL {
        return serverURL.appendingPathComponent("feed")
    }
}

class AxisCamera: Camera {
    
    enum Request: String {
        case start = "/record/start"
        case stop  = "/record/stop"
    }
    
    var stream: URL {
        return URL(string: "rtsp://\(address)/axis-media/media.amp")!
    }
}
