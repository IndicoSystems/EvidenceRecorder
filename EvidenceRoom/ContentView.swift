import SwiftUI

struct ContentView: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    @ObservedObject var appState = AppState.shared
    private var cloudClient = CloudClient.shared
    
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
                    cloudClient.signOut {
                        appState.isSignedOut = true
                    }
                    
//                    cloudClient.signOut { ft4Response in
//                        switch ft4Response.statusCode {
//                        case 200:
//                            UserDefaults.standard.setValue(nil, forKey: "token")
//                        default:
//                            print("Sign out failed with status:", ft4Response.statusCode)
//                        }
//                    }
                } label: {
                    Image(systemName: "icloud.and.arrow.down.fill")
                }
            )
            
            TodayView()
        }.fullScreenCover(isPresented: $appState.isSignedOut, content: LoginView.init)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
