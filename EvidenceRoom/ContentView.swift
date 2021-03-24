import SwiftUI

struct ContentView: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    @ObservedObject var authClient = CloudClient.shared
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: TodayView()) {
                    Text("Today")
                }
                Divider()
                    .padding()
                NavigationLink(destination: RoomsView()) {
                    Text("Rooms")
                }
                Divider()
                    .padding()
//                NavigationLink(destination: CasesView()) {
//                    Text("Cases")
//                }
//                Divider()
//                    .padding()
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
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
            
            TodayView()
        }.fullScreenCover(isPresented: $authClient.isSignedOut, content: LoginView.init)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
