import SwiftUI

struct TaskView: View {
    
    let task: Task
    
    var body: some View {
        
        if task.fields.count > 0 {
            Form {
                ForEach(task.fields, id: \.id) { field in
                    TaskFieldView(viewModel: TaskFieldViewModel(field: field))
                }
            }
            .padding()
            .navigationTitle(Text(getTranslation(dict: task.name)))
        } else {
            Text("No content")
                .font(.title2)
                .foregroundColor(.gray)
                .navigationTitle(Text(getTranslation(dict: task.name)))
        }
    }
}
