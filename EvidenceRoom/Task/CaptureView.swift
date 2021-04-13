import SwiftUI

struct CaptureView: View {
    
    @ObservedObject var viewModel: TaskFieldViewModel
    
    var body: some View {
        
        if let assignedRoom = CloudClient.shared.assignedRoom {
            VStack(alignment: .leading) {
                Text("Cameras:")
                    .font(.caption)
                HStack {
                    ForEach(assignedRoom.cameras, id: \.id) { camera in
                        Text(camera.name)
                            .padding()
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(16)
                    }
                }
                
                Button(viewModel.isRecording ? "Stopp opptak" : "Start opptak") {
                    viewModel.tapCapture()
                }
                .padding()
                .buttonStyle(EvidenceButtonStyle(bgColor: .secondary, clipShape: .capsule))
            }
        } else {
            Text("No assigned room")
        }
    }
}
