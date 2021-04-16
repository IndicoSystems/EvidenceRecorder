import SwiftUI

struct UserPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        Form {
            Text("Sign in")
                .font(.largeTitle)
                .padding()
            TextField("Username", text: $username)
                .autocapitalization(.none)
                .padding()
            SecureField("Password", text: $password)
                .autocapitalization(.none)
                .padding()
            
            HStack {
                Spacer()
                Button("Sign in") {
                    CloudClient.shared.signIn(username: username, password: password) { ft4Response in
                        
                        switch ft4Response.statusCode {
                        case 0, 400..<600:
                            DispatchQueue.main.async {
                                AppState.shared.isSignedOut = true
                            }
                        default:
                            DispatchQueue.main.async {
                                AppState.shared.isSignedOut = false
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                }
                .buttonStyle(EvidenceButtonStyle(bgColor: .secondary, clipShape: .capsule))
            }
            .padding()
        }
        .padding()
    }
}

struct UserPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        UserPasswordView()
    }
}
