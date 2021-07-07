import SwiftUI

class CaptureViewModel: ObservableObject {
    
    private let field: TaskField
    
    @Published var isRecording = false
    
    init(field: TaskField) {
        self.field = field
    }
    
    func tapCapture() {
        if let assignedRoom = AppState.shared.assignedRoom {
            for var camera in assignedRoom.cameras {
                if camera.isRecording {
                    camera.stopRecording { [weak self] result in
                        switch result {
                        case .success(let recordingInfo):
                            Logger.log(category: .info, level: .custodyMajor, action: "capture", subaction: "stop", target: camera.id, targetType: .device, inTarget: camera.roomId, inTargetType: .room)
                            print(recordingInfo.id)
                            print("Camera \(camera.name) ended successfully")
                            DispatchQueue.main.async {
                                self?.isRecording = false
                                camera.isRecording = false
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                } else {
                    camera.startRecording(fieldId: field.id) { [weak self] result in
                        switch result {
                        case .success(let success):
                            if success {
                                Logger.log(category: .info, level: .custodyMajor, action: "capture", subaction: "start", target: camera.id, targetType: .device, inTarget: camera.roomId, inTargetType: .room)
                                DispatchQueue.main.async {
                                    print("Camera \(camera.name) started successfully")
                                    self?.isRecording = true
                                    camera.isRecording = true
                                }
                            } else {
                                DispatchQueue.main.async {
                                    print("Camera \(camera.name) is already recording")
                                    self?.isRecording = true
                                    camera.isRecording = true
                                }
                            }
                        case .failure(let error):
                            print("Camera \(camera.name) failed with error: \(error.localizedDescription)")
                        }
                    }
                }
            }
        } else {
            print("No room assigned")
        }
    }
}

struct CaptureView: View {
    
    @ObservedObject var viewModel: CaptureViewModel
    
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
                                .fill(camera.isRecording ? Color.green : Color.red)
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
