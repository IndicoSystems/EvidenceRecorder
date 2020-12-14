import SwiftUI
import OAuthSwift

struct LoginView: View {
    
    @ObservedObject var authClient = AuthClient.shared
    
    @State private var host = ""
    
    var body: some View {
        
        Form {
            TextField("Host", text: $host) { changed in
                
            } onCommit: {
                authClient.signIn(withHost: host)
            }
            
            Button("Sign in") {
                authClient.signIn(withHost: host)
                hideKeyboard()
            }
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
