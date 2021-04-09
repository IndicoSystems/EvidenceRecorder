import SwiftUI

struct CameraView: View {
    
    let camera: Camera
    
    @State private var isRecording = false
    
    var body: some View {
        VStack {
            Text(camera.name)
                .font(.custom("Roboto-Regular", size: 20))
                .foregroundColor(.text)
            WebView(url: camera.streamURL!.string)
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
