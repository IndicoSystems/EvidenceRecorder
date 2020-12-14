import SwiftUI

struct AddCameraView: View {
    
    @State private var cameraIP = ""
    @State private var cameraPort = ""
    
    @Binding var isPresented: Bool
    
    var body: some View {
        Form {
            Section {
                TextField("IP", text: $cameraIP)
                TextField("Port", text: $cameraPort)
            }
            Section {
                Button("Add") {
                    isPresented = false
                }
            }
        }
    }
}
