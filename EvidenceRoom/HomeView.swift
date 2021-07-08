import SwiftUI

struct HomeView: View {
    
    @StateObject private var appState = AppState.shared
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Spacer()
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
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                }
                
                Spacer()
                
                VStack {
                    Text("Powered by")
                    Text("Indico Systems AS")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.gray)
                .padding()
            }
            .navigationTitle("Evidence")
            .navigationBarItems(trailing:
                Button {
                    CloudClient.shared.signOut {
                        DispatchQueue.main.async {
                            appState.isSignedOut = true
                        }
                    }
                } label: {
                    Image(systemName: "icloud.and.arrow.down.fill")
                }
            )
            
            TodayView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
