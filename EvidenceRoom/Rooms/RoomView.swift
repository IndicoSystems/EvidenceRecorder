import SwiftUI

struct RoomView: View {
    
    let room: Room
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        Form {
            Section(header: Text("Cameras")) {
                LazyVGrid(columns: columns) {
                    ForEach(room.cameras, id: \.id) { camera in
                        CameraView(camera: camera)
                    }
                }
                .navigationTitle(room.name)
                .padding()
            }
        }
    }
}
