import SwiftUI

struct TodayView: View {
    
    @ObservedObject var cloudClient = CloudClient.shared
    
    var body: some View {
        Form {
            if cloudClient.tasks.count <= 0 {
                ProgressView()
            } else {
                ForEach(cloudClient.tasks.sorted(by: {$0.date < $1.date}), id: \.id) { task in
                    NavigationLink(destination: TaskView(task: task)) {
                        TodayCellView(task: task)
                    }
                }
            }
        }
        .navigationTitle(Text("Today"))
        .onAppear {
            cloudClient.getPendingTasks()
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
