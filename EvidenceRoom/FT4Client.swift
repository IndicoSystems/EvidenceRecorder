import Foundation

class FT4Client: ObservableObject {
    static let shared = FT4Client()
    
    private init() {}
    
    func signIn() {
        var request = URLRequest(url: URL(string: "https://evidence.indicosys.com/auth")!)
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let err = error {
                print(err.localizedDescription)
            }
        }.resume()
    }
}
