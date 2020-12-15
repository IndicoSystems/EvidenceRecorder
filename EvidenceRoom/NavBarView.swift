import SwiftUI

struct NavBarView: View {
    
    @ObservedObject var authClient = AuthClient.shared
    
    
    var body: some View {
        VStack {
            Spacer()
            Button("TS") {
                authClient.signOut()
            }
            .padding()
            .background(Color.pink)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
                
        }
        .background(Color.mysterioBlue)
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}
