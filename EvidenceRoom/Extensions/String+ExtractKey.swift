import Foundation

extension String {
    func extract(fromKey key: String) -> String? {
        guard let data = self.data(using: .utf8) else { return nil }
        let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: String]
        return json[key]
    }
}
