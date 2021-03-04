import SwiftUI

struct FormsView: View {
    
    @ObservedObject private var cloudClient = CloudClient.shared
    
    @Binding var activeForm: ERForm?
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cloudClient.forms, id: \.form.form.id) { form in
                    Text(form.title)
                        .font(.title2)
                        .padding()
                        .onTapGesture {
                            activeForm = form
                            presentationMode.wrappedValue.dismiss()
                        }
                }
            }.navigationTitle(Text("Forms"))
        }
    }
}
