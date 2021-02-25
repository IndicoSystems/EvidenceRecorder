import SwiftUI
import SwiftKeychainWrapper

class CameraViewModel: ObservableObject {
    
    var camera: Camera
    
    @Published var isRecording = false
    @Published var isPreviewing = false
    
    init(camera: Camera) {
        self.camera = camera
    }
    
    func startRecording() {
        camera.startRecording() { [unowned self] result in
            switch result {
            case .success(let success):
                if success {
                    DispatchQueue.main.async {
                        self.isRecording = true
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isRecording = false
                }
                print(error.localizedDescription)
            }
        }
    }
    
    func stopRecording() {
        camera.stopRecording() { [unowned self] result in
            switch result {
            case .success(let recordingResponse):
                self.getUploadURL(recordingInfo: recordingResponse)
                
                DispatchQueue.main.async {
                    self.isRecording = false
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getUploadURL(recordingInfo: RecordingInfo) {
        
        DispatchQueue.global().async {
            AuthClient.shared.authenticate()
            
            DispatchQueue.main.async {
                CloudClient.shared.createFile(with: recordingInfo.id, size: recordingInfo.fileSize) { result in
                    switch result {
                    case .success(let url):
                        let file = File(location: url, id: recordingInfo.id)
//                        self.camera.upload(file: file)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

struct CameraView: View {
    
    @ObservedObject var viewModel: CameraViewModel
    
    var body: some View {
        
        VStack {
            Text(viewModel.camera.name)
                .font(.custom("Roboto-Regular", size: 20))
                .foregroundColor(.text)
            if viewModel.isPreviewing || viewModel.isRecording {
                WebView(url: viewModel.camera.streamURL.string)
                    .frame(width: 900, height: 600)
            } else {
                Image("camera")
                    .foregroundColor(.text)
            }
            Button {
                viewModel.isRecording ? viewModel.stopRecording() : viewModel.startRecording()
            } label: {
                Image(viewModel.isRecording ? "stop" : "record")
                    .resizable()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color.red)
            }
            
            Button(viewModel.isPreviewing ? "Hide preview" : "Show preview") {
                viewModel.isPreviewing.toggle()
            }
            .buttonStyle(EvidenceButtonStyle(bgColor: .secondary, clipShape: .capsule))
            
        }
        .padding()
    }
}
