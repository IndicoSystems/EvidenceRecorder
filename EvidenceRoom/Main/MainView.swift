import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var cameras = [AxisCamera]()
    @Published var isLoadingCameras = false
    
    @Published var cameraViewModels = [CameraViewModel]()
    
    init() {
        isLoadingCameras = true
        let _ = CloudClient.shared.fetchCameras(from: URL(string: "http://10.0.0.21:8089/cameras")!) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let cams):
                DispatchQueue.main.async {
                    self.cameras = cams
                    
                    
                    for cam in cams {
                        self.cameraViewModels.append(CameraViewModel(camera: cam))
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                self.isLoadingCameras = false
            }
        }
    }
}

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    @State var isRecordingFromAllCameras = false
    
    var body: some View {
        VStack {
            HStack {
                if viewModel.isLoadingCameras {
                    ProgressView()
                } else {
                    if viewModel.cameras.count > 0 {
                        ForEach(viewModel.cameraViewModels, id: \.camera.ip) { viewModel in
                            CameraView(viewModel: viewModel)
                        }
                    } else {
                        Text("No cameras found")
                            .font(.caption)
                    }
                }
            }
            
            Button(isRecordingFromAllCameras ? "Stop all cameras" : "Start all cameras") {
                for cameraViewModel in viewModel.cameraViewModels {
                    isRecordingFromAllCameras ? cameraViewModel.stopRecording() : cameraViewModel.startRecording()
                }
                
                isRecordingFromAllCameras.toggle()
            }
            .buttonStyle(EvidenceButtonStyle(bgColor: .secondary, clipShape: .roundedRect))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
