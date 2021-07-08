import SwiftUI

class LoadingViewModel: ObservableObject {
    
    func loadDataFromServer(completion: @escaping()->()) {
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
        
        dispatchGroup.enter()
        CloudClient.shared.getDevices { devices in
            DispatchQueue.main.async {
                AppState.shared.devices = devices
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion()
        }
    }
}

struct LoadingView: View {
    
    @StateObject private var viewModel = LoadingViewModel()
    @ObservedObject var appState = AppState.shared
    
    @Binding var isFinishedLoading: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 240, height: 240)
                VStack {
                    ProgressView()
                    Text("Loading")
                }
            }
            .onAppear {
                viewModel.loadDataFromServer {
                    isFinishedLoading = true
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isFinishedLoading: .constant(false))
    }
}
