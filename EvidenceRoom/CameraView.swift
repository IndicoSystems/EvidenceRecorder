import SwiftUI

struct CameraView: View {
    
    let camera: Camera
    
    @State private var isRecording = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(camera.name)
//                .font(.custom("Roboto-Regular", size: 20))
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.text)
            WebView(url: camera.streamURL!.string)
                .frame(width: 400, height: 400 / (16/9))
        }.padding()
    }
}
