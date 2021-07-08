import SwiftUI

class AddNewTaskViewModel: ObservableObject {
    
    func createTask(withName name: String, completion: @escaping ()->()) {
        
        let titleField = TaskField(id: UUID().uuidString, entityField: nil, title: ["en" : "Title"], placeholder: nil, description: nil, required: true, type: .text, min: nil, max: nil, features: [], answer: name, exhibits: [], subtasks: [], options: [])
        
        let fileField = TaskField(id: UUID().uuidString, entityField: nil, title: ["en" : "Recordings"], placeholder: nil, description: nil, required: true, type: .file, min: nil, max: nil, features: ["video", "audio", "capture"], answer: nil, exhibits: [], subtasks: [], options: [])
        
        let task = Task(id: UUID().uuidString, template: false, complete: false, entity: nil, entityId: nil, name: ["en" : "Quick capture"], projectId: nil, projectName: nil, dueAt: nil, fields: [titleField, fileField])

        CloudClient.shared.submitTask(task: task) { response in
            if response.statusCode >= 200 && response.statusCode < 300 {
                Logger.log(category: .change, level: .usersMinor, action: "create_task")
                DispatchQueue.main.async {
                    AppState.shared.tasks.append(task)
                    completion()
                }
            }
        } failure: { error in
            Logger.log(category: .error, level: .techSupport, action: "create_task", details: ["error" : error.error])
        }

    }
}

struct AddNewTaskView: View {
    
    @State private var taskName: String = ""
    @StateObject var viewModel = AddNewTaskViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section {
                TextField("Task name", text: $taskName)
                
                Button("Create task") {
                    if !taskName.isEmpty {
                        viewModel.createTask(withName: taskName) {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
        .navigationTitle(Text("Add new task"))
    }
}

struct AddNewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskView()
    }
}
