import SwiftUI

struct SubTaskView: View {
    
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(getTranslation(dict: task.name))
                .font(.caption)
            if let fields = task.fields {
                ForEach(fields, id: \.id) { field in
                    Text(field.answer ?? "No answer")
                }
            }
        }
    }
}
