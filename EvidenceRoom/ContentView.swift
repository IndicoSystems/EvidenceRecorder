import SwiftUI

struct ContentView: View {
    
    @ObservedObject var authClient = AuthClient.shared
    
    @State private var isLoginPresented = false
    
    var body: some View {
        ZStack {
            Color.background
            VStack {
                TitleView()
                    .padding(.top)
                Spacer()
                MainView()
                    .fullScreenCover(isPresented: $authClient.isSignedOut, content: LoginView.init)
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
