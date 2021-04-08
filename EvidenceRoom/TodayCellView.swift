import SwiftUI

struct TodayCellView: View {
    
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let dueDate = task.dueAt {
                Text(dueDate)
                    .font(.caption)
            }
            Text(task.name)
                .font(.title)
        }
        .padding()
    }
}
