import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Text("indico")
                .font(.custom("MetroDF", size: 56))
            Text("Evidence Recorder")
                .font(.custom("Roboto-Regular", size: 27))
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
