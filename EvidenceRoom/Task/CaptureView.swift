import SwiftUI

struct CaptureView: View {
    
    @ObservedObject var viewModel: TaskFieldViewModel
    
    var body: some View {
        
        if let assignedRoom = AppState.shared.assignedRoom {
            VStack(alignment: .leading) {
                Text("Cameras:")
                    .font(.caption)
                HStack {
                    ForEach(assignedRoom.cameras, id: \.id) { camera in
                        HStack {
                            Text(camera.name)
                            Circle()
                                .fill(Color.red)
                                .frame(width: 16, height: 16)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
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
