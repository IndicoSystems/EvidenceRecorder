import SwiftUI

struct RoomsView: View {
    
    private var cloudClient = CloudClient.shared
    @ObservedObject var appState = AppState.shared
    
    var body: some View {
        Form {
            ForEach(appState.rooms, id: \.id) { room in
                
                NavigationLink(destination: RoomView(room: room)) {
                    Text(room.name)
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
