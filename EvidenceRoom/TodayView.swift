import SwiftUI

struct TodayView: View {
    
    private var cloudClient = CloudClient.shared
    @ObservedObject var appState = AppState.shared
    @State private var isAddNewTaskShowing = false
    
    var body: some View {
        
        ZStack {
            Form {
                ForEach(appState.tasks.sorted(by: {$0.date < $1.date}), id: \.id) { task in
                    NavigationLink(destination: TaskView(viewModel: TaskViewModel(task: task))) {
                        TodayCellView(viewModel: TodayCellViewModel(task: task))
                    }
                }
            }
            .navigationTitle(Text("Today"))
            .navigationBarItems(trailing:
                                    Button(action: {
                                        isAddNewTaskShowing = true
                                    }, label: {
                                        Image(systemName: "plus")
                                            .padding()
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                    }).opacity(appState.tasks.count <= 0 ? 0 : 1)
            )
            .sheet(isPresented: $isAddNewTaskShowing, content: {
                AddNewTaskView()
            })
            if appState.tasks.count <= 0 {
                VStack {
                    Text("No tasks")
                    Button(action: {
                        isAddNewTaskShowing = true
                    }, label: {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    })
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
