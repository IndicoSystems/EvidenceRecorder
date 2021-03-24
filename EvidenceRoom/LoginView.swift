import SwiftUI
import OAuthSwift

struct LoginView: View {
    
    @State private var host = ""
    @State private var isUserPassViewPresented = false
    
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
                            UserDefaults.standard.setValue(host, forKey: "host")
                            isUserPassViewPresented = true
                        }
                        .textFieldStyle(EvidenceTextFieldStyle())
                        .autocapitalization(.none)
                    }
                    .padding(.horizontal)
                                        
                    HStack {
                        Spacer()
                        
                        Button("Sign in") {
//                            authClient.signIn(withHost: host)
                            UserDefaults.standard.setValue(host, forKey: "host")
                            isUserPassViewPresented = true
                        }
                        .buttonStyle(EvidenceButtonStyle(bgColor: .secondary, clipShape: .capsule))
                        .padding()
                    }
                }
                .background(Color.card)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
                .frame(width: UIScreen.main.bounds.width / 2)
            }
        }
        .sheet(isPresented: $isUserPassViewPresented) {
            UserPasswordView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
