import SwiftUI

struct RoomsView: View {
    
    @ObservedObject var cloudClient = CloudClient.shared
    
    var body: some View {
        List {
            ForEach(cloudClient.rooms, id: \.id) { room in
                
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
