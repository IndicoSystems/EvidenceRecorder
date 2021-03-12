import SwiftUI

struct RoomView: View {
    
    let room: Room
    
    let columns: [GridItem] = [
//        GridItem(.adaptive(minimum: 500, maximum: .infinity), alignment: .center)
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var allCamerasRecording = false
    
    @State private var cameraViewModels = [CameraViewModel]()
    
    var body: some View {
//        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(room.cameras, id: \.id) { camera in
                    
                    CameraView(viewModel: CameraViewModel(camera: camera))
                        .background(Color.gray.opacity(0.2))
                }
            }
            .navigationTitle(room.name)
            .navigationBarItems(trailing: Button(allCamerasRecording ? "Stop all" : "Start all") {
                
//                allCamerasRecording ? stopAllCameras() : startAllCameras()
                
                toggleAllCameras()
            })
            .padding()
        }
    
    func toggleAllCameras() {
        cameraViewModels.removeAll()
        
        for (i, cam) in room.cameras.enumerated() {
            
            let camViewModel = CameraViewModel(camera: cam)
            cameraViewModels.append(camViewModel)
            cameraViewModels[i].isRecording ? camViewModel.stopRecording() : camViewModel.startRecording()
        }
        
        allCamerasRecording.toggle()
    }
    
    func startAllCameras() {
//        let uploadingCameras = room.cameras.filter({$0 is Uploader})
        
        for cam in room.cameras {
            
            let camViewModel = CameraViewModel(camera: cam)
            camViewModel.startRecording()
            
//            cam.startRecording() { result in
//                switch result {
//                case .success(let success):
//                    if success {
//                        print("Success!")
//                        allCamerasRecording = true
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }

        }
    }
    
    func stopAllCameras() {
//        let uploadingCameras = room.cameras.filter({$0 is Uploader})
        
        for cam in room.cameras {
            
            let camViewModel = CameraViewModel(camera: cam)
            camViewModel.stopRecording()
//            cam.stopRecording() { result in
//                switch result {
//                case .success(let recordingResponse):
//                    cam.getUploadURL(recordingInfo: recordingResponse)
//                    allCamerasRecording = false
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
        }
    }
//    }
}

//struct RoomView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        RoomView(room: Room(apolloRoom: GetRoomsQuery.Data.Room(id: "1234", name: "Mock")))
//    }
//}
