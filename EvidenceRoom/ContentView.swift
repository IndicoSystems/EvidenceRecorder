import SwiftUI

struct ContentView: View {
    
    @ObservedObject var appState = AppState.shared
    @State private var isFinishedLoading = false
    
    var body: some View {
        ZStack {
            HomeView()
            
            LoginView()
                .opacity(CloudClient.shared.token == nil ? 1 : 0)
            
            if !isFinishedLoading && !appState.isSignedOut {
                LoadingView(isFinishedLoading: $isFinishedLoading)
                    .opacity(isFinishedLoading ? 0 : 1)
            }
        }
    }
}
