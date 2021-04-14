import Foundation
import SwiftUI
import SwiftKeychainWrapper

public typealias Email = String
public typealias MimeType = String
public typealias LongString = String
public typealias ShortString = String
public typealias ShortReqString = String
public typealias Longitude = Double
public typealias Latitude = Double
public typealias PositiveInt = Int
public typealias PositiveNonZeroInt = Int
public typealias DateTime = String
public typealias Json = [String : Any?]

class CloudClient: ObservableObject {
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Endpoint: String {
        case api = "api/"
        case auth = "auth/"
    }
    
    static let shared = CloudClient()
    
    @Published var rooms = [Room]()
    @Published var cameras = [Camera]()
    @Published var projects = [Project]()
    @Published var tasks = [Task]()
    
    var assignedRoom: Room? {
        let assignedRoomId = UserDefaults.standard.string(forKey: "assignedRoomId")
        return rooms.first(where: {$0.id == assignedRoomId })
    }
    
    @Published var isSignedOut = true
    
    private init() {
        authenticate()
    }
    
    private func phpRequest(method: HTTPMethod, endpoint: Endpoint, payload: [String : Any]? = nil, completion: @escaping (Result<FT4Response, Error>)->()) {
        
        if endpoint == .api && isSignedOut {
            return
        }
        
        let host = UserDefaults.standard.string(forKey: "host") ?? ""
        let url = URL(string: "https://\(host)/")!
        var request = URLRequest(url: url.appendingPathComponent(endpoint.rawValue))
        request.httpMethod = method.rawValue
        
        if let token = UserDefaults.standard.string(forKey: "token") {
            request.allHTTPHeaderFields = ["indico-access-token" : token]
        }
        
        switch method {
        case .post:
            if let payload = payload {
                let json = try! JSONSerialization.data(withJSONObject: payload)
                request.httpBody = json
            }
        default:
            break
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let err = error {
                completion(.failure(err))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if let d = data {
                    let ft4Response = FT4Response(statusCode: response.statusCode, body: d)
                    completion(.success(ft4Response))
                }
            }
            
            
        }.resume()
    }
    
    func getDevices() {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_devices"]) { result in
            switch result {
            case .success(let ft4Response):
                
                do {
                    let cams = try JSONDecoder().decode([Axis].self, from: ft4Response.body)
                    DispatchQueue.main.async {
                        self.cameras = cams
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getRooms() {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_rooms"]) { result in
            switch result {
            case .success(let ft4Response):
                let rooms = try! JSONDecoder().decode([Room].self, from: ft4Response.body)
                DispatchQueue.main.async {
                    self.rooms = rooms
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getProjects() {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_projects"]) { result in
            switch result {
            case .success(let ft4Response):
                let projects = try! JSONDecoder().decode([Project].self, from: ft4Response.body)
                DispatchQueue.main.async {
                    self.projects = projects
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTasks(inProjectWithID id: String?) {
        
        var payload = [String : String]()
        if let id = id {
            payload = [
                "action"     : "get_tasks_in_project",
                "project_id" : id
            ]
        } else {
            payload = [
                "action" : "get_tasks"
            ]
        }
        
        phpRequest(method: .post, endpoint: .api, payload: payload) { result in
            switch result {
            case .success(let ft4Response):
                let tasks = try! JSONDecoder().decode([Task].self, from: ft4Response.body)
                DispatchQueue.main.async {
                    self.tasks = tasks
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getIncompleteTasks() {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_pending_tasks"]) { result in
            switch result {
            case .success(let ft4Response):
                let tasks = try! JSONDecoder().decode([Task].self, from: ft4Response.body)
                DispatchQueue.main.async {
                    self.tasks = tasks
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func submitTask(withId id: String, fields: [String : Any]) {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "submit_task", "task_id" : id, "fields" : [fields]]) { result in
            switch result {
            case .success(let ft4Response):
                print(ft4Response.statusCode)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func signIn(username: String, password: String, completion: @escaping (FT4Response)->()) {
        phpRequest(method: .post, endpoint: .auth, payload: ["action" : "sign_in", "username" : username, "password" : password]) { result in
            switch result {
            case .success(let ft4Response):
                
                switch ft4Response.statusCode {
                case 0, 400..<600:
                    completion(ft4Response)
                    return
                default:
                    completion(ft4Response)
                }
                
                let json = try! JSONSerialization.jsonObject(with: ft4Response.body) as! [String : Any]
                guard let token = json["access_token"] as? String else { return }
                UserDefaults.standard.setValue(token, forKey: "token")
                
                self.getRooms()
                self.getDevices()
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func signOut() {
        
        phpRequest(method: .post, endpoint: .auth, payload: ["action" : "sign_out"]) { result in
            switch result {
            case .success(let ft4Response):
                switch ft4Response.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        self.isSignedOut = true
                    }
                    
                    UserDefaults.standard.setValue(nil, forKey: "token")
                default:
                    break
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func authenticate() {
        guard let _ = UserDefaults.standard.string(forKey: "token") else {
            return
        }
        
        isSignedOut = false
        
        getRooms()
        getDevices()
    }
    
    func createExhibit(taskFieldId: String, completion: @escaping (Int)->()) {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "create_exhibit", "id" : UUID().uuidString, "taskfield_id" : taskFieldId]) { result in
            switch result {
            case .success(let ft4Response):
                completion(ft4Response.statusCode)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension Date {
    var iso8601: String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [ISO8601DateFormatter.Options.withInternetDateTime, ISO8601DateFormatter.Options.withFractionalSeconds]
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.string(from: self)
    }
}

struct FT4Response {
    let statusCode: Int
    let body: Data
}
