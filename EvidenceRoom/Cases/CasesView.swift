import SwiftUI

struct CasesView: View {
    
    @ObservedObject var cloudClient = CloudClient.shared
    
    var body: some View {
        List {
            ForEach(cloudClient.cases, id: \.id) { c in
                NavigationLink(
                    destination: CaseView().environmentObject(c),
                    label: {
                        Text(c.name)
                            .font(.title)
                            .padding()
                    })
            }
        }
        .onAppear {
            if cloudClient.cases.isEmpty {
                cloudClient.getCases()
            }
        }
        .navigationTitle("Cases")
    }
}

struct CasesView_Previews: PreviewProvider {
    static var previews: some View {
        CasesView()
    }
}
