import SwiftUI
import SwiftKeychainWrapper

class CameraViewModel: ObservableObject {
    
    var networkClient = CameraNetworkingClient()
    
    var camera: Camera
    
    @Published var isRecording = false
    @Published var isPreviewing = false
    
    init(camera: Camera) {
        self.camera = camera
    }
    
    func startRecording() {
        networkClient.startRecording(camera: camera) { [unowned self] result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.isRecording = true
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
        networkClient.stopRecording(camera: camera) { [unowned self] result in
            switch result {
            case .success(let recordingResponse):
                self.getUploadURL(recordingResponse: recordingResponse)
                
                DispatchQueue.main.async {
                    self.isRecording = false
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getUploadURL(recordingResponse: RecordingResponse) {        
        CloudClient.shared.createFile(with: recordingResponse.id, size: recordingResponse.recordingInfo.fileSize) { result in
            switch result {
            case .success(let url):
                let file = File(location: url, id: recordingResponse.id)
                self.networkClient.upload(file: file, from: self.camera)
            case .failure(let error):
                print(error.localizedDescription)
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
                .fontWeight(.bold)
                .foregroundColor(.text)
            if viewModel.isPreviewing || viewModel.isRecording {
                WebView(url: "http://" + viewModel.camera.ip)
                    .frame(width: 400, height: 300)
            } else {
                Image("camera")
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
        .frame(width: 500, height: 500)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(viewModel.isRecording ? Color.red : Color.gray, lineWidth: viewModel.isRecording ? 4 : 1)
        )
    }
}
