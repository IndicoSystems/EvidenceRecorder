import SwiftUI

struct TaskView: View {
    
    let task: Task
    
    var body: some View {
        
        if let fields = task.fields {
            if fields.count > 0 {
                Form {
                    ForEach(fields, id: \.id) { field in
                        TaskFieldView(viewModel: TaskFieldViewModel(field: field))
                    }
                }
                .padding()
                .navigationTitle(Text(task.name))
            } else {
                Text("No content")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .navigationTitle(Text(task.name))
            }
        }
    }
}
