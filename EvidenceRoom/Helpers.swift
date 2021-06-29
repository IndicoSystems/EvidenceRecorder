import Foundation

struct HTTPMethod {
    static let get = "GET"
    static let post = "POST"
}

struct CameraCommand {
    static let startRecording = "record/start"
    static let stopRecording = "record/stop"
    static let upload = "file"
    static let feed = "feed"
}

func getTranslation(dict: [String:String]?) -> String {
    guard let dict=dict else { return "" }

    let current = dict[Locale.preferredLanguages[0].components(separatedBy: "-")[0]] ?? ""
    return current != "" ? current : dict.first(where: { $1 != "" })?.value ?? ""
}
