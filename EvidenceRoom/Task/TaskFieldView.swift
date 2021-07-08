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
        if let answer = field.answer {
            return answer.isEmpty ? getTranslation(dict: field.placeholder) : answer
        } else {
            return getTranslation(dict: field.placeholder)
        }
    }
    
    var dateString: String {
        let f = field
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = f.features.contains("date") || f.features.isEmpty ?.long:.none
        dateFormatter.timeStyle = f.features.contains("time") || f.features.isEmpty ?.short:.none
        
        let dF = DateFormatter()
        if (f.features.contains("time") && f.features.contains("date")) || f.features.isEmpty {
            dF.dateFormat = "yyyy-MM-dd'T'HH:mm"
        } else if f.features.contains("time") {
            dF.dateFormat = "'T'HH:mm"
        } else if f.features.contains("date") {
            dF.dateFormat = "yyyy-MM-dd"
        }
        
        if let date = dF.date(from: f.answer ?? "") {
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
    
    var title: String {
        getTranslation(dict: field.title)
    }
    
    var exhibits: [Exhibit] {
        field.exhibits
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
                if viewModel.exhibits.count > 0 {
                    ExhibitsView(viewModel: ExhibitsViewModel(exhibits: viewModel.exhibits))
                }
                CaptureView(viewModel: CaptureViewModel(field: viewModel.field))
            case .choice:
                ChoicesView(viewModel: ChoicesViewModel(field: viewModel.field))
            case .time:
                Text(viewModel.dateString)
            case .layout:
                Text("Layout")
            }
        }
    }
}
