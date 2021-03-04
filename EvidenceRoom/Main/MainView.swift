import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var cameras = [Camera]()
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
    
    let columns = [
        GridItem(.flexible()),
//        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack {
            Spacer()
            if viewModel.isLoadingCameras {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.cameraViewModels, id: \.camera.id) { viewModel in
                            CameraView(viewModel: viewModel)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                    }
                    .padding()
                }
                
            }
            
            Button(isRecordingFromAllCameras ? "Stop all cameras" : "Start all cameras") {
                for cameraViewModel in viewModel.cameraViewModels {
                    isRecordingFromAllCameras ? cameraViewModel.stopRecording() : cameraViewModel.startRecording()
                }
                
                isRecordingFromAllCameras.toggle()
            }
            .buttonStyle(EvidenceButtonStyle(bgColor: .secondary, clipShape: .roundedRect))
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
