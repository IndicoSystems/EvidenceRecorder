import Foundation

extension Date {
    var iso8601: String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [ISO8601DateFormatter.Options.withInternetDateTime, ISO8601DateFormatter.Options.withFractionalSeconds]
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.string(from: self)
    }
    
    var ft4TimeStamp: String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        return formatter.string(from: self)
    }
}
