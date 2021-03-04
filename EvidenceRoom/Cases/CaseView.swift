import SwiftUI

struct CaseView: View {
    
//    @ObservedObject var `case`: ERCase
    
    @EnvironmentObject var `case`: ERCase
    
    @State private var isShowingFormsView = false
    
    @State private var activeReport: ERForm?
    
    var body: some View {
        VStack(spacing: 16) {
            
            if let _ = activeReport {
                ReportView(report: $activeReport)
            } else {
                if `case`.reports.isEmpty {
                    Text("No content in case")
                } else {
                    List {
                        ForEach(`case`.reports, id: \.id) { report in
                            Text(report.name)
                        }
                    }
                }
                
                Button {
                    isShowingFormsView = true
                } label: {
                    Text("New report")
                        .font(.title)
                        .padding()
                        .background(Color.secondary)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
        .sheet(isPresented: $isShowingFormsView, content: {
            FormsView(activeForm: $activeReport)
        })
        .navigationTitle(Text(`case`.name))
    }
    
    func addNewReport() {
        print("Add new report")
    }
}

//struct CaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        CaseView(case: ERCase(papiCase: PapiCase(id: "123456", name: "Test Case")))
//    }
//}
