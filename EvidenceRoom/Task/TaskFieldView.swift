import SwiftUI

struct TaskFieldView: View {
    
    let field: TaskField
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if field.type != .capture {
                Text(field.title.extract(fromKey: "no") ?? "")
                    .font(.caption)
            }
            
            switch field.type {
            case .text:
                Text(field.answer ?? "")
                    .font(.title)
            case .person:
                Text("Person")
            case .subtask:
                if let subTasks = field.subTasks {
                    ForEach(subTasks, id: \.id) { task in
                        SubTaskView(task: task)
                    }
                }
            case .capture:
                Button("Start opptak") {
                    
                    if let assignedRoom = CloudClient.shared.assignedRoom {
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
                    }
                }
                .padding()
                .buttonStyle(EvidenceButtonStyle(bgColor: .secondary, clipShape: .capsule))
            }
        }
    }
}
