import SwiftUI

class TaskViewModel: ObservableObject {
    private let task: Task
    
    var title: String {
        task.fields.first?.answer ?? getTranslation(dict: task.name)
    }
    
    var fields: [TaskField] {
        task.fields
    }
    
    init(task: Task) {
        self.task = task
    }
}

struct TaskView: View {
    
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        
        if viewModel.fields.count > 0 {
            Form {
                ForEach(viewModel.fields, id: \.id) { field in
                    TaskFieldView(viewModel: TaskFieldViewModel(field: field))
                }
            }
            .navigationTitle(Text(viewModel.title))
        } else {
            Text("No content")
                .font(.title2)
                .foregroundColor(.gray)
                .navigationTitle(Text(viewModel.title))
        }
    }
}
