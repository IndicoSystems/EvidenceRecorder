import SwiftUI

struct RoomView: View {
    
    let room: Room
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(room.cameras, id: \.id) { camera in
                    CameraView(camera: camera)
                        .background(Color.gray.opacity(0.2))
                }
            }
            .navigationTitle(room.name)
            .padding()
        }
    }
}
