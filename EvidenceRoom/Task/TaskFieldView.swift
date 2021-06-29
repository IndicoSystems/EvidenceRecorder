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
//        field.title.extract(fromKey: "no") ?? ""
    }
    
    var subTasks: [Task] {
        field.subtasks
    }
    
    func tapCapture() {
        if let assignedRoom = AppState.shared.assignedRoom {
            for var camera in assignedRoom.cameras {
                if camera.isRecording {
                    camera.stopRecording { result in
                        switch result {
                        case .success(let recordingInfo):
                            print(recordingInfo.id)
                            DispatchQueue.main.async {
                                camera.isRecording = false
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                } else {
                    camera.startRecording(fieldId: field.id) { result in
                        switch result {
                        case .success(let success):
                            if success {
                                DispatchQueue.main.async {
                                    camera.isRecording = true
                                }
                                
                            } else {
                                DispatchQueue.main.async {
                                    camera.isRecording = true
                                }
                            }
                        case .failure(let error):
                            print("Camera \(camera.name) failed with error: \(error.localizedDescription)")
                        }
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
            
            if viewModel.type != .file {
                Text(viewModel.title)
                    .font(.caption)
            }
            
            switch viewModel.type {
//            case .text:
//                Text(viewModel.answer)
//                    .font(.title)
//            case .subtask:
//                if let subTasks = viewModel.subTasks {
//                    ForEach(subTasks, id: \.id) { task in
//                        SubTaskView(task: task)
//                    }
//                }
//            case .number:
//                Text("Number")
            case .file:
                CaptureView(viewModel: viewModel)
            default:
                EmptyView()
            }
        }
    }
}
