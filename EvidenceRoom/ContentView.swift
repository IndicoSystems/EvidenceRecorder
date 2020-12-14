import SwiftUI

struct ContentView: View {
    
    @ObservedObject var authClient = AuthClient.shared
    
    @State private var isLoginPresented = false
    
    var body: some View {
        ZStack {
            Color.background
            VStack {
                VStack {
                    Text("indico")
                        .font(.custom("MetroDF", size: 56))
                        .foregroundColor(.text)
                    Text("Evidence Recorder")
                        .font(.custom("MetroDF", size: 27))
                        .foregroundColor(.text)
                }
                .padding(.top)
                Spacer()
                MainView()
                    .sheet(isPresented: $authClient.isSignedOut, content: {
                        LoginView()
                    })
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
