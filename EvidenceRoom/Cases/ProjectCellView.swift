import SwiftUI

struct ProjectCellView: View {
    
    let project: Project
    
    @State private var imageName = ""
    
    var body: some View {
        VStack {
            HStack {
                Text(project.name)
                    .font(.title)
                Spacer()
                switch project.permission {
                case .read:
                    Image(systemName: "lock.fill")
                        .foregroundColor(.black)
                case .write:
                    Image(systemName: "lock.open.fill")
                        .foregroundColor(.black)
                default:
                    EmptyView()
                }
            }
        }
        .padding()
    }
}

struct ProjectCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProjectCellView(project: Project(id: UUID().uuidString, name: "Pelikansaken", permission: .write))
    }
}
