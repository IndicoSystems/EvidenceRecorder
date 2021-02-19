import Foundation

struct Room: Decodable {
    let name: String
    let cameras: [Camera]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case cameras = "cameras"
    }
}

class Camera: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case ip = "IP"
        case port = "port"
        case name = "name"
    }
    
    let ip: String
    let port: Int
    let name: String
    
    var url: URL {
        return URL(string: "http://\(ip):\(port)")!
    }
    
    init(ip: String, port: Int, name: String) {
        self.ip = ip
        self.port = port
        self.name = name
    }
    
    var streamURL: URL {
        return serverURL.appendingPathComponent("feed")
    }
    
    init(apolloCam: GetRoomsQuery.Data.Room.Camera) {
        self.id = apolloCam.id
        self.name = apolloCam.name
        self.address = apolloCam.address
    }
}

class AxisCamera: Camera {
    
    enum Request: String {
        case start = "/record/start"
        case stop  = "/record/stop"
    }
    
    var stream: URL {
        return URL(string: "rtsp://\(ip)/axis-media/media.amp")!
    }
}
