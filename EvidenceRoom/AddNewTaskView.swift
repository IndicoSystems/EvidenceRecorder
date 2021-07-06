import SwiftUI

class AddNewTaskViewModel: ObservableObject {
    
    func createTask(withName name: String) {
        print(AppState.shared.tasks)
        
        let titleField = TaskField(id: UUID().uuidString, entityField: nil, title: ["en" : "Title"], placeholder: nil, description: nil, required: true, type: .text, min: nil, max: nil, features: [], answer: name, exhibits: [], subtasks: [], options: [])
        
        let fileField = TaskField(id: UUID().uuidString, entityField: nil, title: ["en" : "Recordings"], placeholder: nil, description: nil, required: true, type: .file, min: nil, max: nil, features: ["video", "audio", "capture"], answer: nil, exhibits: [], subtasks: [], options: [])
        
        let task = Task(id: UUID().uuidString, template: false, complete: false, entity: nil, entityId: nil, name: ["en" : "Quick capture"], projectId: nil, projectName: nil, dueAt: nil, fields: [titleField, fileField])

        CloudClient.shared.submitTask(task: task) { response in
            if response.statusCode >= 200 && response.statusCode < 300 {
                DispatchQueue.main.async {
                    AppState.shared.tasks.append(task)
                }
            }
        } failure: { error in
            print(error.error)
        }

    }
}

struct AddNewTaskView: View {
    
    @State private var taskName: String = ""
    @StateObject var viewModel = AddNewTaskViewModel()
    
    var body: some View {
        Form {
            Section {
                Text("Add new task")
                    .font(.largeTitle)
                TextField("Task name", text: $taskName)
            }
            
            Button("Create task") {
                if !taskName.isEmpty {
                    viewModel.createTask(withName: taskName)
                }
            }
        }
    }
}

struct AddNewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskView()
    }
}
