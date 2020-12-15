import SwiftUI

struct ContentView: View {
    
    @ObservedObject var authClient = AuthClient.shared
    
    @State private var isLoginPresented = false
    
    var body: some View {
        ZStack {
            Color.background
            HStack(spacing: 0) {
                NavBarView()
                Spacer()
                VStack(alignment: .leading) {
                    Text("Dashboard")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.text)
                        .padding()
                    MainView()
                        .fullScreenCover(isPresented: $authClient.isSignedOut, content: LoginView.init)
                }
                Spacer()
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
