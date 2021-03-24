import SwiftUI

struct CaseView: View {
    
    let project: Project
    
    @State private var isShowingFormsView = false
    
    @ObservedObject var cloudClient = CloudClient.shared
    
    var body: some View {
        VStack {
            if cloudClient.tasks.count <= 0 {
                ProgressView()
            } else {
                ForEach(cloudClient.tasks, id: \.id) { task in
                    NavigationLink(destination: TaskView(task: task)) {
                        Text(task.name)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                }
            }
        }
//        List(cloudClient.tasks, id: \.id) { task in
//            Text(task.name)
//        }
        .onAppear {
            cloudClient.getTasks(inProjectWithID: project.id)
        }
        .navigationTitle(Text(project.name))
    }
}

//struct CaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        CaseView(case: ERCase(papiCase: PapiCase(id: "123456", name: "Test Case")))
//    }
//}
