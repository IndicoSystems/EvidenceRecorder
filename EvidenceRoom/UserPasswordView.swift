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
                    CloudClient.shared.signIn(username: username, password: password) { account in
                        DispatchQueue.main.async {
                            AppState.shared.isSignedOut = false
                            UserDefaults.standard.setValue(account.accessToken, forKey: "token")
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    failure: { error in
                        print(error.error)
                        AppState.shared.isSignedOut = true
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
