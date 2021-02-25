import SwiftUI

struct RoomView: View {
    
    let room: Room
    
    var body: some View {
        VStack {
            ForEach(room.cameras, id: \.id) { camera in
                CameraView(viewModel: CameraViewModel(camera: camera))
            }
        }
    }
}

struct RoomView_Previews: PreviewProvider {
    
    static var previews: some View {
        RoomView(room: Room(apolloRoom: GetRoomsQuery.Data.Room(id: "1234", name: "Mock")))
    }
}
