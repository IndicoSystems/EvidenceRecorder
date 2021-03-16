import SwiftUI

struct CaseView: View {
    
//    @ObservedObject var `case`: ERCase
    
    let project: Project
    
    @State private var isShowingFormsView = false
    
    @State private var activeReport: ERForm?
    
    var body: some View {
        Text(project.name)
    }
}

//struct CaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        CaseView(case: ERCase(papiCase: PapiCase(id: "123456", name: "Test Case")))
//    }
//}
