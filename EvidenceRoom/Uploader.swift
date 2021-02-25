import Foundation

protocol Uploader {
    func upload(file: File)
}

extension Uploader where Self: Camera {
    func upload(file: File) {
        var request = URLRequest(url: serverURL.appendingPathComponent("upload"))
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type" : "application/json-header"
        ]

        let fileData = try! JSONEncoder().encode(file)
        request.httpBody = fileData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let err = error  {
                print(err.localizedDescription)
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print(String(data: data!, encoding: .utf8) ?? "No data")
                } else {
                    print("ERROR! \(response.statusCode)")
                }
            }
        }.resume()
    }
}
