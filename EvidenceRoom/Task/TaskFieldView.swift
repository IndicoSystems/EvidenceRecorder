import SwiftUI

class TaskFieldViewModel: ObservableObject {
    @Published var field: TaskField
    @Published var isRecording = false
    
    init(field: TaskField) {
        self.field = field
    }
    
    var type: TaskFieldType {
        field.type
    }
    
    var answer: String {
        field.answer ?? ""
    }
    
    var title: String {
        getTranslation(dict: field.title)
    }
    
    var subTasks: [Task] {
        field.subtasks
    }
}

struct TaskFieldView: View {
    
    @ObservedObject var viewModel: TaskFieldViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            if viewModel.type != .file {
                Text(viewModel.title)
                    .font(.caption)
            }
            
            switch viewModel.type {
            case .text:
                Text(viewModel.answer)
                    .font(.title)
            case .subtask:
                if let subTasks = viewModel.subTasks {
                    ForEach(subTasks, id: \.id) { task in
                        SubTaskView(task: task)
                    }
                }
            case .number:
                Text(viewModel.answer)
                    .font(.title)
            case .file:
                CaptureView(viewModel: CaptureViewModel(field: viewModel.field))
            case .choice:
                ChoicesView(viewModel: ChoicesViewModel(field: viewModel.field))
            case .time:
                Text(viewModel.answer)
            case .layout:
                Text("Layout")
            }
        }
    }
}
