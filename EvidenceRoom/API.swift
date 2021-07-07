import Foundation

protocol FT4Input: Encodable {
    var action: String { get }
}

struct GetTasksInput: Encodable {
    let action = "get_tasks"
    let projectId: String?
    let template: Bool?
    let complete: Bool?
    let include: GetTaskInclude?
    let archived: Bool?
}

enum GetTaskInclude: String, Encodable {
    case none, answers, full
}

struct SubmitTaskInput: FT4Input {
    let action = "submit_task"
    let task: Task
    let complete: Bool
}

// MARK: - Exhibit

struct Exhibit: Codable {
    let id: String
    var duration: Int?
    var fileSize: Int?
    var mediaType: String?
    var startedAt: String?
    var thumbnail: String?
    var longitude: Double?
    var latitude: Double?
    var altitude: Double?
    var horAccuracy: Double?
    var vertAccuracy: Double?
    var fullAddress: String?
    var streetAddress: String?
    var postalCode: String?
    var area1: String?
    var area2: String?
    var area3: String?
    var area4: String?
    var country: String?
    
    enum CodingKeys: String, CodingKey {
        case id, duration
        case fileSize = "file_size"
        case mediaType = "media_type"
        case startedAt = "started_at"
        case thumbnail, longitude, latitude, altitude
        case horAccuracy = "hor_accuracy"
        case vertAccuracy = "vert_accuracy"
        case fullAddress = "full_address"
        case streetAddress = "street_address"
        case postalCode = "postal_code"
        case area1 = "area_1"
        case area2 = "area_2"
        case area3 = "area_3"
        case area4 = "area_4"
        case country
    }
}

struct CreateExhibitInput: FT4Input {
    let action = "create_exhibit"
    let exhibitId: String
    let taskfieldId: String
    var duration: Int?
    var fileSize: Int?
    var mediaType: String?
    var startedAt: String?
    var longitude: Double?
    var latitude: Double?
    var altitude: Double?
    var horAccuracy: Double?
    var vertAccuracy: Double?
    var fullAddress: String?
    var streetAddress: String?
    var postalCode: String?
    var area1: String?
    var area2: String?
    var area3: String?
    var area4: String?
    var country: String?
    
    enum CodingKeys: String, CodingKey {
        case action
        case exhibitId = "exhibit_id"
        case taskfieldId = "taskfield_id"
        case duration
        case fileSize = "file_size"
        case mediaType = "media_type"
        case startedAt = "started_at"
        case longitude, latitude, altitude
        case horAccuracy = "hor_accuracy"
        case vertAccuracy = "vert_accuracy"
        case fullAddress = "full_address"
        case streetAddress = "street_address"
        case postalCode = "postal_code"
        case area1 = "area_1"
        case area2 = "area_2"
        case area3 = "area_3"
        case area4 = "area_4"
        case country
    }
}

struct CreateExhibitResponse: Codable {
    let uploadKey: String?
    
    enum CodingKeys: String, CodingKey {
        case uploadKey = "upload_key"
    }
}

struct UpdateExhibitInput: FT4Input {
    let action = "update_exhibit"
    let exhibitId: String
    let checksum: String?
    var duration: Int?
    var fileSize: Int?
    var mediaType: String?
    var startedAt: String?
    var longitude: Double?
    var latitude: Double?
    var altitude: Double?
    var horAccuracy: Double?
    var vertAccuracy: Double?
    var fullAddress: String?
    var streetAddress: String?
    var postalCode: String?
    var area1: String?
    var area2: String?
    var area3: String?
    var area4: String?
    var country: String?
    
    enum CodingKeys: String, CodingKey {
        case action
        case exhibitId = "exhibit_id"
        case checksum
        case duration
        case fileSize = "file_size"
        case mediaType = "media_type"
        case startedAt = "started_at"
        case longitude, latitude, altitude
        case horAccuracy = "hor_accuracy"
        case vertAccuracy = "vert_accuracy"
        case fullAddress = "full_address"
        case streetAddress = "street_address"
        case postalCode = "postal_code"
        case area1 = "area_1"
        case area2 = "area_2"
        case area3 = "area_3"
        case area4 = "area_4"
        case country
    }
}

// MARK: - Auth

struct SignInInput: FT4Input {
    let action = "sign_in"
    let username: String
    let password: String
}

struct SignOutInput: FT4Input {
    let action = "sign_out"
}

// MARK: - Account

struct FT4Account: Codable {
    let id: String
    let accessToken: String
    let username: String
    let fullName: String
    let privileges: [String]
}

//MARK: - Devices

struct GetDevicesInput: FT4Input {
    let action = "get_devices"
    let archived = false
}

//MARK: - Rooms

struct GetRoomsInput: FT4Input {
    let action = "get_rooms"
    let archived = false
}

// MARK: - Logging

struct LogInput: Encodable {
    let time = Date().ft4TimeStamp
    let source = "recorder_ios"
    let level: Int
    let category: String
    var initiator: String?
    var action: String
    var subaction: String?
    var target: String?
    var targetType: String?
    var inTarget: String?
    var inTargetType: String?
    var details: [String : String]?
}

// MARK: - Errors

struct FT4Error: Decodable {
    let error: String
}
