import SwiftUI

struct FormView: View {
    
    var form: ERForm
    
    var body: some View {
        Form {
            ForEach(form.form.form.fields!, id: \.id) { field in
                VStack(alignment: .leading) {
                    
                    if let title = field.title["en"] as? String {
                        Text(title)
                            .font(.title2)
                            .padding()
                    }
                    
                    switch field.inputHint {
                    case .input:
                        Text(field.description["nb-NO"] as? String ?? field.description["en"] as? String ?? "No description")
                    case .person:
                        Text("Person")
                    default:
                        Text(field.inputHint.rawValue)
                    }
                    
                }.padding()
            }
            
            Button("Save") {
                print("Save")
            }.buttonStyle(EvidenceButtonStyle(bgColor: .secondary, clipShape: .roundedRect))
            
        }.navigationTitle(form.title)
    }
}
