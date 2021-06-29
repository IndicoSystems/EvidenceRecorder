import SwiftUI

struct CaseView: View {
    
    let project: Project
    
    @State private var isShowingFormsView = false
    
    @ObservedObject var appState = AppState.shared
    
    private var cloudClient = CloudClient.shared
    
    var body: some View {
        VStack {
            if appState.tasks.count <= 0 {
                ProgressView()
            } else {
                ForEach(appState.tasks, id: \.id) { task in
                    NavigationLink(destination: TaskView(viewModel: TaskViewModel(task: task))) {
                        Text(getTranslation(dict: task.name))
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
//        .onAppear {
//            cloudClient.getTasksInProject(projectId: project.id) { tasks in
//                
//            }
//        }
        .navigationTitle(Text(project.name))
    }
}

//struct CaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        CaseView(case: ERCase(papiCase: PapiCase(id: "123456", name: "Test Case")))
//    }
//}
