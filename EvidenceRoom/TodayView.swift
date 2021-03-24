import SwiftUI

struct TodayView: View {
    
    @ObservedObject var cloudClient = CloudClient.shared
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            if cloudClient.tasks.count <= 0 {
                ProgressView()
            } else {
                ForEach(cloudClient.tasks.sorted(by: {$0.date < $1.date}), id: \.id) { task in
                    NavigationLink(destination: TaskView(task: task)) {
                        Text(task.name)
                            .font(.headline)
                    }
                    Text(task.projectName ?? "No project")
                    if let dueAt = task.dueAt {
                        Text(dueAt)
                    }
                }
            }
        }
        .navigationTitle(Text("Today"))
        .onAppear {
            cloudClient.getIncompleteTasks()
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
