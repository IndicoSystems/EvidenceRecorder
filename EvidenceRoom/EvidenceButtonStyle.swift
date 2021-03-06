import SwiftUI

struct EvidenceButtonStyle: ButtonStyle {
    
    var bgColor: Color
    var clipShape: ClipShape
    
    enum ClipShape: Shape {
        case capsule
        case roundedRect
        
        func path(in rect: CGRect) -> Path {
            switch self {
            case .capsule:     return Capsule().path(in: rect)
            case .roundedRect: return RoundedRectangle(cornerRadius: 8).path(in: rect)
            }
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("Roboto-Regular", size: 16, relativeTo: .headline))
            .foregroundColor(.white)
            .frame(height: 48)
            .padding(.horizontal, 24)
            .background(bgColor)
            .clipShape(clipShape)
            .shadow(radius: 4)
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}
