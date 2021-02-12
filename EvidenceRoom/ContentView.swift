import SwiftUI

struct ContentView: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    @ObservedObject var authClient = AuthClient.shared
    
    @State private var isLoginPresented = false
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: MainView()) {
                    Text("Main")
                }
                Divider()
                    .padding()
                NavigationLink(destination: FormsView()) {
                    Text("Forms")
                }
                Divider()
                    .padding()
                NavigationLink(destination: RoomsView()) {
                    Text("Rooms")
                }
                Divider()
                    .padding()
                NavigationLink(destination: CasesView()) {
                    Text("Cases")
                }
            }
            .navigationTitle("Evidence")
            .navigationBarItems(trailing:
                Button {
                    authClient.signOut()
                } label: {
                    Image(systemName: "icloud.and.arrow.down.fill")
                }
            )
        }.fullScreenCover(isPresented: $authClient.isSignedOut, content: LoginView.init)
        
        
//        ZStack {
//            Color.background
//            HStack(spacing: 0) {
////                NavBarView()
////                Spacer()
//                VStack(alignment: .leading) {
//                    Text("Dashboard")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.text)
//                        .padding()
////                    MainView()
////                        .padding()
//                    RoomsView()
////                    FormsView()
////                        .background(Color.card)
////                        .padding()
////                        .fullScreenCover(isPresented: $authClient.isSignedOut, content: LoginView.init)
//                }
////                Spacer()
//            }
//            Button {
//                authClient.signOut()
//            } label: {
//                Image(systemName: "icloud.and.arrow.down.fill")
//                    .resizable()
//                    .frame(width: 32, height: 32)
//            }
//            .padding()
//        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
