import Combine

typealias PapiCase = GetCasesQuery.Data.Case

class ERCase: ObservableObject {
    
    let id: String
    let name: String
    @Published var reports: [PapiCase.Report]
    
    init(papiCase: PapiCase) {
        self.id = papiCase.id
        self.name = papiCase.name
        self.reports = papiCase.reports ?? [PapiCase.Report]()
    }
}
