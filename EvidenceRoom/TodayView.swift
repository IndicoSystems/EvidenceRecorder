import SwiftUI

struct TodayView: View {
    
    private var cloudClient = CloudClient.shared
    @ObservedObject var appState = AppState.shared
    
    var body: some View {
        Form {
            if appState.tasks.count <= 0 {
                ProgressView()
            } else {
                ForEach(appState.tasks.sorted(by: {$0.date < $1.date}), id: \.id) { task in
                    NavigationLink(destination: TaskView(task: task)) {
                        TodayCellView(task: task)
                    }
                }
            }
        }
        .navigationTitle(Text("Today"))
        .onAppear {
            cloudClient.getPendingTasks() { tasks in
                DispatchQueue.main.async {
                    appState.tasks = tasks
                }
            }
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
