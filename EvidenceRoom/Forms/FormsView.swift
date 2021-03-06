import SwiftUI

struct FormsView: View {
    
    @ObservedObject private var cloudClient = CloudClient.shared
    
    var body: some View {
        
        List {
            ForEach(cloudClient.forms, id: \.self) { form in
                Button {
                    print(form)
                } label: {
                    Text(form)
                }
            }
        }
        .navigationTitle("Forms")
        
        
//        GeometryReader { gr in
//            Form {
//                ForEach(cloudClient.forms, id: \.self) { form in
//                    Text(form)
//                        .font(.custom("Roboto-Regular", size: 32))
//                        .foregroundColor(.text)
//                        .listRowBackground(Color.clear)
//                        .padding()
//                }
//            }.frame(width: gr.size.width * 0.5)
//        }
    }
}
