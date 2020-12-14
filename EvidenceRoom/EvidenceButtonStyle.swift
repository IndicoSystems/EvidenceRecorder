import SwiftUI

struct EvidenceButtonStyle: ButtonStyle {
    var bgColor: Color
    
    var clipShape: ClipShape
    
    enum ClipShape: String, CaseIterable, Shape {
        case capsule = "Capsule"
        case roundedRect = "Rounded Rectangle"
        
        func path(in rect: CGRect) -> Path {
            switch self {
            case .capsule:     return Capsule().path(in: rect)
            case .roundedRect: return RoundedRectangle(cornerRadius: 8).path(in: rect)
            }
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("Roboto", size: 16, relativeTo: .headline))
            .foregroundColor(.white)
            .padding(.horizontal, 48)
            .padding(.vertical, 25)
            .background(bgColor)
//            .clipShape(RoundedRectangle(cornerRadius: 8))
            .clipShape(clipShape)
            .shadow(radius: 4)
    }
}
