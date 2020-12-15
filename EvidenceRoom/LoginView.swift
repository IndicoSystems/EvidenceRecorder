import SwiftUI
import OAuthSwift

struct LoginView: View {
    
    @ObservedObject var authClient = AuthClient.shared
    
    @State private var host = ""
    
    var body: some View {
        
        ZStack {
            Color.background
            
            VStack {
                TitleView()
                    .foregroundColor(.text)
                VStack(alignment: .leading) {
                    Text("Sign in to server")
                        .font(.custom("Roboto-Regular", size: 32))
                        .foregroundColor(.text)
                        .padding()
                    
                    HStack {
                        Text("https://")
                            .font(.custom("Roboto-Regular", size: 16))
                            .foregroundColor(.text)
                        
                        TextField("Host", text: $host) { changed in
                            
                        } onCommit: {
                            authClient.signIn(withHost: host)
                        }
                        .textFieldStyle(EvidenceTextFieldStyle())
                        .autocapitalization(.none)
                    }
                    .padding(.horizontal)
                                        
                    HStack {
                        Spacer()
                        
                        Button("Sign in") {
                            authClient.signIn(withHost: host)
                        }
                        .buttonStyle(EvidenceButtonStyle(bgColor: .secondary, clipShape: .capsule))
                        .padding()
                    }
                }
                .background(Color.card)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
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
