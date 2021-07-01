import SwiftUI

class TodayCellViewModel: ObservableObject {
    private let task: Task
    
    var title: String {
        task.fields.first?.answer ?? getTranslation(dict: task.name)
    }
    
    var dueAt: String {
        task.dueAt ?? "No due date"
    }
    
    var templateTitle: String {
        getTranslation(dict: task.name)
    }
    
    init(task: Task) {
        self.task = task
    }
}

struct TodayCellView: View {
    
    @ObservedObject var viewModel: TodayCellViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.dueAt)
                .font(.caption)
                .foregroundColor(.gray)
            Text(viewModel.title)
                .font(.title)
            Text(viewModel.templateTitle)
                .font(.title3)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
