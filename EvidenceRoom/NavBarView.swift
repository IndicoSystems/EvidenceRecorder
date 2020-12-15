import SwiftUI

struct NavBarView: View {
    var body: some View {
        VStack {
            Spacer()
            Button("TS") {
                print("Sign out")
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
