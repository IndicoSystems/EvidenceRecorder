import Foundation

class CloudClient {
    
    enum HTTPMethod: String {
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
    
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .ft4
        return decoder
    }()
    
    private lazy var jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .ft4
        return encoder
    }()
    
//    private func apiRequest(endpoint: Endpoint, payload: [String : Any], completion: @escaping (Result<FT4Response, Error>)->()) {
//
//        if endpoint == .api && AppState.shared.isSignedOut {
//            return
//        }
//
//        let url = URL(string: "https://\(host)/")!
//        var request = URLRequest(url: url.appendingPathComponent(endpoint.rawValue))
//        request.httpMethod = HTTPMethod.post.rawValue
//
//        if let token = token {
//            request.allHTTPHeaderFields = ["indico-access-token" : token]
//        }
//
//        let json = try! JSONSerialization.data(withJSONObject: payload)
//        request.httpBody = json
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let err = error {
//                completion(.failure(err))
//                return
//            }
//
//            if let response = response as? HTTPURLResponse {
//                if let d = data {
//                    let ft4Response = FT4Response(statusCode: response.statusCode, body: d)
//                    completion(.success(ft4Response))
//                }
//            }
//        }.resume()
//    }
    
    private func apiRequest(endpoint: Endpoint, payload: Data, completion: @escaping (Result<FT4Response, Error>)->()) {
        let url = URL(string: "https://\(host)/")!
        var request = URLRequest(url: url.appendingPathComponent(endpoint.rawValue))
        request.httpMethod = HTTPMethod.post.rawValue
        
        if let token = token {
            request.allHTTPHeaderFields = ["indico-access-token" : token]
        }
        request.httpBody = payload
        
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
        let getDevicesInput = GetDevicesInput(archived: false)
        let payload = try! jsonEncoder.encode(getDevicesInput)
        
        apiRequest(endpoint: .api, payload: payload) { result in
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
        let getRoomsInput = GetRoomsInput()
        let payload = try! jsonEncoder.encode(getRoomsInput)
        
        apiRequest(endpoint: .api, payload: payload) { result in
            switch result {
            case .success(let ft4Response):
                let rooms = try! JSONDecoder().decode([Room].self, from: ft4Response.body)
                completion(rooms)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
//    func getProjects(completion: @escaping ([Project])->()) {
//        apiRequest(endpoint: .api, payload: ["action" : "get_projects"]) { result in
//            switch result {
//            case .success(let ft4Response):
//                let projects = try! JSONDecoder().decode([Project].self, from: ft4Response.body)
//                completion(projects)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    func getTasksInProject(projectId id: String, completion: @escaping ([Task])->()) {
//        apiRequest(endpoint: .api, payload: ["action" : "get_tasks_in_project", "project_id" : id]) { result in
//            switch result {
//            case .success(let ft4Response):
//                let tasks = try! JSONDecoder().decode([Task].self, from: ft4Response.body)
//                completion(tasks)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    func getPendingTasks(completion: @escaping ([Task])->()) {
//        apiRequest(endpoint: .api, payload: ["action" : "get_tasks"]) { result in
//            switch result {
//            case .success(let ft4Response):
//                let tasks = try! JSONDecoder().decode([Task].self, from: ft4Response.body)
//                completion(tasks)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    func getTasks(completion: @escaping ([Task]) -> (), failure: @escaping (FT4Error) -> ()) {
        let input = GetTasksInput(projectId: nil, template: false, complete: false, include: .full, archived: false)
        let payload = try! jsonEncoder.encode(input)
        
        apiRequest(endpoint: .api, payload: payload) { result in
            switch result {
            case .success(let ft4Response):
                switch ft4Response.statusCode {
                case 200..<300:
                    let tasks = try! self.jsonDecoder.decode([Task].self, from: ft4Response.body)
                    completion(tasks)
                    break
                default:
                    let error = try! self.jsonDecoder.decode(FT4Error.self, from: ft4Response.body)
                    failure(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
//    func submitTask(withId id: String, fields: [String : Any]) {
//        apiRequest(endpoint: .api, payload: ["action" : "submit_task", "task_id" : id, "fields" : [fields]]) { result in
//            switch result {
//            case .success(let ft4Response):
//                print(ft4Response.statusCode)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    func submitTask(task: Task, complete: Bool? = nil, completion: @escaping (FT4Response)->(), failure: @escaping (FT4Error) -> ()) {
        
        do {
            let input = SubmitTaskInput(task: task, complete: complete ?? false)
            let payload = try self.jsonEncoder.encode(input)
            
            apiRequest(endpoint: .api, payload: payload) { result in
                switch result {
                case .success(let ft4Response):
                    if ft4Response.statusCode >= 200 && ft4Response.statusCode < 300 {
                        completion(ft4Response)
                    } else {
                        if let response = try? JSONDecoder().decode(FT4Error.self, from: ft4Response.body) {
                            failure(response)
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
//    func signIn(username: String, password: String, completion: @escaping (FT4Response)->()) {
//        apiRequest(endpoint: .auth, payload: ["action" : "sign_in", "username" : username, "password" : password]) { result in
//            switch result {
//            case .success(let ft4Response):
//
//                switch ft4Response.statusCode {
//                case 0, 400..<600:
//                    completion(ft4Response)
//                    return
//                default:
//                    completion(ft4Response)
//                }
//
//                let json = try! JSONSerialization.jsonObject(with: ft4Response.body) as! [String : Any]
//                guard let token = json["access_token"] as? String else { return }
//                UserDefaults.standard.setValue(token, forKey: "token")
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//    }
    
    func signIn(username: String, password: String, completion: @escaping (FT4Account)->(), failure: @escaping (FT4Error) -> ()) {
        
        let input = SignInInput(username: username, password: password)
        let payload = try! jsonEncoder.encode(input)
        
        apiRequest(endpoint: .auth, payload: payload) { result in
            switch result {
            case .success(let ft4Response):
                switch ft4Response.statusCode {
                case 0, 400..<600:
                    if let error = try? self.jsonDecoder.decode(FT4Error.self, from: ft4Response.body) {
                        failure(error)
                    }
                    return
                default:
                    let account = try! self.jsonDecoder.decode(FT4Account.self, from: ft4Response.body)
                    completion(account)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
//    func signOut(completion: @escaping (FT4Response)->()) {
//        apiRequest(endpoint: .auth, payload: ["action" : "sign_out"]) { result in
//            switch result {
//            case .success(let ft4Response):
//                completion(ft4Response)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    func signOut(completion: @escaping () -> ()) {
        
        let input = SignOutInput()
        let payload = try! jsonEncoder.encode(input)
        
        apiRequest(endpoint: .auth, payload: payload) { result in
            switch result {
            case .success(let ft4Response):
                switch ft4Response.statusCode {
                case 200..<300:
                    UserDefaults.standard.setValue(nil, forKey: "token")
                    completion()
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
    
//    func createExhibit(taskFieldId: String, completion: @escaping (Data)->()) {
//        apiRequest(endpoint: .api, payload: ["action" : "create_exhibit", "exhibit_id" : UUID().uuidString, "taskfield_id" : taskFieldId, "started_at" : Date().ft4TimeStamp]) { result in
//            switch result {
//            case .success(let ft4Response):
//                completion(ft4Response.body)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    func createExhibit(exhibit: Exhibit, taskFieldId: String, completion: @escaping (CreateExhibitResponse)->(), failure: @escaping (FT4Error)->()) {
        
        let input = CreateExhibitInput(exhibitId: exhibit.id,
                                       taskfieldId: taskFieldId,
                                       duration: exhibit.duration,
                                       fileSize: exhibit.fileSize,
                                       mediaType: exhibit.mediaType!,
                                       startedAt: exhibit.startedAt!)
        
        let payload = try! jsonEncoder.encode(input)
        
//        let p = payload.compactMapValues {$0}
        
        apiRequest(endpoint: .api, payload: payload) { result in
            switch result {
            case .success(let ft4Response):
                
                if ft4Response.statusCode >= 200 && ft4Response.statusCode < 300 {
                    if let response = try? JSONDecoder().decode(CreateExhibitResponse.self, from: ft4Response.body) {
                        completion(response)
                    } else {
                        let error = try! JSONDecoder().decode(FT4Error.self, from: ft4Response.body)
                        failure(error)
                    }
                } else {
                    if let response = try? JSONDecoder().decode(FT4Error.self, from: ft4Response.body) {
                        failure(response)
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
//    func updateExhibit(exhibit: Exhibit, completion: @escaping (Int)->()) {
//        // TODO: - Needs checksum and location
//        apiRequest(endpoint: .api, payload: ["action" : "update_exhibit", "exhibit_id" : exhibit.id]) { result in
//            switch result {
//            case .success(let ft4Response):
//                completion(ft4Response.statusCode)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    func updateExhibit(exhibit: Exhibit, completion: @escaping (FT4Response)->()) {
        // TODO: - Needs checksum and location
        
        let input = UpdateExhibitInput(exhibitId: exhibit.id,
                                       checksum: "",
                                       duration: exhibit.duration,
                                       fileSize: exhibit.fileSize,
                                       startedAt: exhibit.startedAt!,
                                       longitude: exhibit.longitude,
                                       latitude: exhibit.latitude,
                                       altitude: exhibit.altitude,
                                       horAccuracy: exhibit.horAccuracy,
                                       vertAccuracy: exhibit.vertAccuracy,
                                       fullAddress: exhibit.fullAddress,
                                       streetAddress: exhibit.streetAddress,
                                       postalCode: exhibit.postalCode,
                                       area1: exhibit.area1,
                                       area2: exhibit.area2,
                                       area3: exhibit.area3,
                                       area4: exhibit.area4,
                                       country: exhibit.country)
        
        let payload = try! jsonEncoder.encode(input)
        
        apiRequest(endpoint: .api, payload: payload) { result in
            switch result {
            case .success(let ft4Response):
                completion(ft4Response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
//    func getTaskTemplates(completion: @escaping ([Task]) -> ()) {
//        apiRequest(endpoint: .api, payload: ["action" : "get_task_templates"]) { result in
//            switch result {
//            case .success(let ft4Response):
//                let templates = try! JSONDecoder().decode([Task].self, from: ft4Response.body)
//                completion(templates)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    func createTaskFromTemplate(completion: @escaping (Int)->()) {
//        apiRequest(endpoint: .api, payload: ["action" : "create_task_from_template"]) { result in
//            switch result {
//            case .success(let ft4Response):
//                completion(ft4Response.statusCode)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    func submitTask(completion: @escaping (Int)->()) {
//        apiRequest(endpoint: .api, payload: ["action" : "submit_task"]) { result in
//            switch result {
//            case .success(let ft4Response):
//                completion(ft4Response.statusCode)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    func getAccount(withId id: String, completion: @escaping (String) -> ()) {
//        apiRequest(endpoint: .api, payload: ["action" : "get_account", "account_id" : id]) { result in
//            switch result {
//            case .success(let ft4Response):
//                completion(String(data: ft4Response.body, encoding: .utf8)!)
//            case .failure(let error):
//                completion(error.localizedDescription)
//            }
//        }
//    }
}
