import SwiftUI

struct CasesView: View {
    
    @ObservedObject var cloudClient = CloudClient.shared
    @State private var permission = Permission.all
    
    var body: some View {
        
        VStack {
            Picker("Permission", selection: $permission) {
                ForEach(Permission.allCases, id: \.self) {
                    Text($0.rawValue.uppercased())
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if cloudClient.projects.count <= 0 {
                Text("No projects found")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
            } else {
                List {
                    Section {
                        switch permission {
                        case .all:
                            ForEach(cloudClient.projects, id: \.id) { project in
                                NavigationLink(
                                    destination: CaseView(project: project),
                                    label: {
                                        ProjectCellView(project: project)
                                    })
                            }
                        default:
                            ForEach(cloudClient.projects.filter({ $0.permission == permission }), id: \.id) { project in
                                NavigationLink(
                                    destination: CaseView(project: project),
                                    label: {
                                        ProjectCellView(project: project)
                                    })
                            }
                        }
                    }
                }
            }
        }.navigationTitle("Cases")
    }
}

struct CasesView_Previews: PreviewProvider {
    static var previews: some View {
        CasesView()
    }
}
