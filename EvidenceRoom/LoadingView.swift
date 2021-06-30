import SwiftUI

struct LoadingView: View {
    
    @Namespace private var animation
    @State private var isPresented = false
    
    @Binding var isFinishedLoading: Bool
    
    var body: some View {
        
        VStack {
            
            VStack {
                if isFinishedLoading {
                    Text("Finished")
                        .matchedGeometryEffect(id: "Test", in: animation)
                } else {
                    ProgressView()
                    Text("Loading")
                        .matchedGeometryEffect(id: "Test", in: animation)
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isFinishedLoading: .constant(false))
    }
}
