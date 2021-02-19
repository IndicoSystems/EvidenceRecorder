import Foundation

extension String {
    func jwt() -> String {
        let components = self.components(separatedBy: ".")
        
        let payload = components[1]
        let decodedData = Data(base64Encoded: payload)!
        let decodedPayload = String(data: decodedData, encoding: .utf8)!
        
        return decodedPayload
    }
}
