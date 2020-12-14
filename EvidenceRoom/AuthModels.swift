import Foundation

struct Endpoint: Codable {
    let auth: Auth
    let download: Download
    let logging: Logging
    let reports: Reports
    let papi: String
}

struct Auth: Codable {
    let base: String
    let wellknown: Wellknown
}

struct Download: Codable {
    let base: String
}

struct Logging: Codable {
    let base: String
    let type: String
}

struct Reports: Codable {
    let base: String
    let type: String
}

struct Wellknown: Codable {
    let authorizationEndpoint, tokenEndpoint: String
    
    enum CodingKeys: String, CodingKey {
        case authorizationEndpoint = "authorization_endpoint"
        case tokenEndpoint = "token_endpoint"
    }
}
