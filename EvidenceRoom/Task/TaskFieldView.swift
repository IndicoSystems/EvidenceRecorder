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
        field.title.extract(fromKey: "no") ?? ""
    }
    
    var subTasks: [Task] {
        field.subTasks ?? [Task]()
    }
    
    func tapCapture() {
        if let assignedRoom = AppState.shared.assignedRoom {
            for camera in assignedRoom.cameras {
                camera.startRecording(fieldId: field.id) { result in
                    switch result {
                    case .success(let success):
                        if success {
                            print("Camera \(camera.name) started")
                        } else {
                            print("Camera \(camera.name) already recording")
                        }
                    case .failure(let error):
                        print("Camera \(camera.name) failed with error: \(error.localizedDescription)")
                    }
                }
            }
        } else {
            print("No room assigned")
        }
    }
}

struct TaskFieldView: View {
    
    @ObservedObject var viewModel: TaskFieldViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if viewModel.type != .capture {
                Text(viewModel.title)
                    .font(.caption)
            }
            
            switch viewModel.type {
            case .text:
                Text(viewModel.answer)
                    .font(.title)
            case .person:
                Text("Person")
            case .subtask:
                if let subTasks = viewModel.subTasks {
                    ForEach(subTasks, id: \.id) { task in
                        SubTaskView(task: task)
                    }
                }
            case .capture:
                CaptureView(viewModel: viewModel)
            }
        }
    }
}
