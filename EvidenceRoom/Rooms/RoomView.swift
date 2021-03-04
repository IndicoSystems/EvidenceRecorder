import SwiftUI

struct RoomView: View {
    
    let room: Room
    
    let columns: [GridItem] = [
//        GridItem(.adaptive(minimum: 500, maximum: .infinity), alignment: .center)
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
//        VStack {
//            ForEach(room.cameras, id: \.id) { camera in
//                CameraView(viewModel: CameraViewModel(camera: camera))
//            }
//        }
//        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(room.cameras, id: \.id) { camera in
                    
                    CameraView(viewModel: CameraViewModel(camera: camera))
                        .background(Color.gray.opacity(0.2))
                }
            }
            .navigationTitle(room.name)
            .padding()
        }
//    }
}

//struct RoomView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        RoomView(room: Room(apolloRoom: GetRoomsQuery.Data.Room(id: "1234", name: "Mock")))
//    }
//}
