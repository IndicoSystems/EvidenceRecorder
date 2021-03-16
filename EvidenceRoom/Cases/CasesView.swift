import SwiftUI

struct CasesView: View {
    
    @ObservedObject var cloudClient = CloudClient.shared
    
    var body: some View {
        if cloudClient.projects.count <= 0 {
            ProgressView()
                .navigationTitle("Cases")
        } else {
            List {
                ForEach(cloudClient.projects, id: \.id) { project in
                    NavigationLink(
                        destination: CaseView(project: project),
                        label: {
                            Text(project.name)
                                .font(.title)
                                .padding()
                        })
                }
            }.navigationTitle("Cases")
        }
    }
}

struct CasesView_Previews: PreviewProvider {
    static var previews: some View {
        CasesView()
    }
}
