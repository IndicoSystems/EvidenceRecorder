import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var isFinishedLoading = false
    
    init() {
        loadDataFromServer()
    }
    
    func loadDataFromServer() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        CloudClient.shared.getTasks { tasks in
            DispatchQueue.main.async {
                AppState.shared.tasks = tasks
                dispatchGroup.leave()
            }
        } failure: { error in
            print(error.error)
        }

        dispatchGroup.enter()
        CloudClient.shared.getRooms { rooms in
            DispatchQueue.main.async {
                AppState.shared.rooms = rooms
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.isFinishedLoading = true
        }
    }
}

struct ContentView: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    private let cloudClient = CloudClient.shared
    @ObservedObject var appState = AppState.shared
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        
        if appState.isSignedOut {
            LoginView()
        } else if viewModel.isFinishedLoading {
            HomeView()
                .fullScreenCover(isPresented: $appState.isSignedOut, content: LoginView.init)
        } else {
            LoadingView(isFinishedLoading: $viewModel.isFinishedLoading)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
