import SwiftUI

struct EvidenceTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.custom("Roboto-Regular", size: 16))
            .padding()
            .background(RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(LinearGradient(gradient: Gradient(colors: [.primary, .secondary]), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
    }
}
