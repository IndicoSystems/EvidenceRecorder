import SwiftUI
import SwiftKeychainWrapper

class CameraViewModel: ObservableObject {
    
    var camera: Camera
    
    @Published var isRecording = false
    @Published var isPreviewing = false
    
    init(camera: Camera) {
        self.camera = camera
    }
    
    func stopRecording() {
        camera.stopRecording() { [unowned self] result in
            switch result {
            case .success(let recordingResponse):
//                self.getUploadURL(recordingInfo: recordingResponse)
                
                DispatchQueue.main.async {
                    self.isRecording = false
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct CameraView: View {
    
    @ObservedObject var viewModel: CameraViewModel
    
    @State private var isRecording = false
    
    var body: some View {
        VStack {
            Text(viewModel.camera.name)
                .font(.custom("Roboto-Regular", size: 20))
                .foregroundColor(.text)
            WebView(url: viewModel.camera.streamURL!.string)
                .frame(width: 400, height: 400 / (16/9))
            Button {
                isRecording.toggle()
            } label: {
                Image(isRecording ? "stop" : "record")
                    .resizable()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color.red)
            }
        }.padding()
    }
}
