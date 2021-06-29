import SwiftUI

class RoomsViewModel: ObservableObject {
//    @Published var rooms = [Room]()
    
    init() {
        getRooms()
    }
    
    func getRooms() {
        CloudClient.shared.getRooms { rooms in
            DispatchQueue.main.async {
                AppState.shared.rooms = rooms
            }
        }
    }
}

struct RoomsView: View {
    
    private var cloudClient = CloudClient.shared
    @ObservedObject var appState = AppState.shared
    @StateObject var viewModel = RoomsViewModel()
    
    var body: some View {
        List {
            ForEach(appState.rooms, id: \.id) { room in
                
                NavigationLink(destination: RoomView(room: room)) {
                    Button {
                        print(room.name)
                    } label: {
                        Text(room.name)
                    }
                }
            }
        }
        .navigationTitle("Rooms")
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView()
    }
}
