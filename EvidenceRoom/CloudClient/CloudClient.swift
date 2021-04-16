import Foundation

class CloudClient {
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Endpoint: String {
        case api = "api/"
        case auth = "auth/"
    }
    
    static let shared = CloudClient()
    
    var host: String {
        UserDefaults.standard.string(forKey: "host") ?? ""
    }
    
    var token: String? {
        UserDefaults.standard.string(forKey: "token")
    }
    
    private init() {
        authenticate()
    }
    
    private func phpRequest(method: HTTPMethod, endpoint: Endpoint, payload: [String : Any], completion: @escaping (Result<FT4Response, Error>)->()) {
        
        if endpoint == .api && AppState.shared.isSignedOut {
            return
        }
        
        let url = URL(string: "https://\(host)/")!
        var request = URLRequest(url: url.appendingPathComponent(endpoint.rawValue))
        request.httpMethod = method.rawValue
        
        if let token = token {
            request.allHTTPHeaderFields = ["indico-access-token" : token]
        }
        
        if case .post = method {
            let json = try! JSONSerialization.data(withJSONObject: payload)
            request.httpBody = json
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
    
    func getDevices(completion: @escaping ([Device])->()) {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_devices"]) { result in
            switch result {
            case .success(let ft4Response):
                
                do {
                    let cams = try JSONDecoder().decode([Axis].self, from: ft4Response.body)
                    completion(cams)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getRooms(completion: @escaping ([Room])->()) {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_rooms"]) { result in
            switch result {
            case .success(let ft4Response):
                let rooms = try! JSONDecoder().decode([Room].self, from: ft4Response.body)
                completion(rooms)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getProjects(completion: @escaping ([Project])->()) {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_projects"]) { result in
            switch result {
            case .success(let ft4Response):
                let projects = try! JSONDecoder().decode([Project].self, from: ft4Response.body)
                completion(projects)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTasksInProject(projectId id: String?, completion: @escaping ([Task])->()) {
        
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
                completion(tasks)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getPendingTasks(completion: @escaping ([Task])->()) {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_pending_tasks"]) { result in
            switch result {
            case .success(let ft4Response):
                let tasks = try! JSONDecoder().decode([Task].self, from: ft4Response.body)
                completion(tasks)
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
        
        AppState.shared.isSignedOut = false
    }
    
    func createExhibit(taskFieldId: String, completion: @escaping (Data)->()) {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "create_exhibit", "exhibit_id" : UUID().uuidString, "taskfield_id" : taskFieldId, "started_at" : Date().ft4TimeStamp]) { result in
            switch result {
            case .success(let ft4Response):
                completion(ft4Response.body)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func updateExhibit(exhibit: Exhibit, completion: @escaping (Int)->()) {
        // TODO: - Needs checksum and location
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "update_exhibit", "exhibit_id" : exhibit.id]) { result in
            switch result {
            case .success(let ft4Response):
                completion(ft4Response.statusCode)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTaskTemplates(completion: @escaping ([Task]) -> ()) {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_task_templates"]) { result in
            switch result {
            case .success(let ft4Response):
                let templates = try! JSONDecoder().decode([Task].self, from: ft4Response.body)
                completion(templates)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func createTaskFromTemplate(completion: @escaping (Int)->()) {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "create_task_from_template"]) { result in
            switch result {
            case .success(let ft4Response):
                completion(ft4Response.statusCode)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func submitTask(completion: @escaping (Int)->()) {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "submit_task"]) { result in
            switch result {
            case .success(let ft4Response):
                completion(ft4Response.statusCode)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getAccount(withId id: String, completion: @escaping (String) -> ()) {
        phpRequest(method: .post, endpoint: .api, payload: ["action" : "get_account", "account_id" : id]) { result in
            switch result {
            case .success(let ft4Response):
                completion(String(data: ft4Response.body, encoding: .utf8)!)
            case .failure(let error):
                completion(error.localizedDescription)
            }
        }
    }
}
