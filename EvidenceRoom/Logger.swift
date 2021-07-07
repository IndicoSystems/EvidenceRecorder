import Foundation

struct Logger {
    
    private static var request: URLRequest = {
        let url = URL(string: "https://" + CloudClient.shared.host)!.appendingPathComponent("logging/")
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.allHTTPHeaderFields = [
            "indico-log-key" : "8NTPnrHqvAUz"
        ]
        return req
    }()
    
    enum LogCategory: String {
        case read, change, error, info
    }
    
    enum LogLevel: Int {
        case usersMinor = 2
        case custodyMajor = 4
        case custodyMinor = 5
        case techSupport = 7
        case techCoder = 8
        case techDebug = 9
    }
    
    enum TargetType: String {
        case exhibit, taskfield, task, project, account, collection, device, room, person
    }
    
    static func log(category: LogCategory, level: LogLevel, action: String, subaction: String? = nil, target: String? = nil, targetType: TargetType? = nil, inTarget: String? = nil, inTargetType: TargetType? = nil, details: [String:String]? = nil) {
        
        let input = LogInput(level: level.rawValue,
                             category: category.rawValue,
                             action: action,
                             subaction: subaction,
                             target: target,
                             targetType: targetType?.rawValue,
                             inTarget: inTarget,
                             inTargetType: inTargetType?.rawValue,
                             details: details)
        
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        
        let body = try! jsonEncoder.encode(input)
        
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request).resume()
    }
}
