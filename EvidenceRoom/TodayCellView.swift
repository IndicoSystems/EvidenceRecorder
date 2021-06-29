import SwiftUI

class TodayCellViewModel: ObservableObject {
    private let task: Task
    
    var title: String {
        task.fields.first?.answer ?? getTranslation(dict: task.name)
    }
    
    var dueAt: String? {
        task.dueAt
    }
    
    init(task: Task) {
        self.task = task
    }
}

struct TodayCellView: View {
    
    @ObservedObject var viewModel: TodayCellViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let dueDate = viewModel.dueAt {
                Text(dueDate)
                    .font(.caption)
            }
            Text(viewModel.title)
                .font(.title)
        }
        .padding()
    }
}
