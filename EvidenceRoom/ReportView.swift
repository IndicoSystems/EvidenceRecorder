import SwiftUI

struct ReportView: View {
    
    @Binding var report: ERForm?
    
    var body: some View {
        VStack {
            if let report = report {
                Form {
                    Text(report.title)
                        .font(.largeTitle)
                }
            }
            HStack {
                Button("Cancel") {
                    report = nil
                }
                
                Button("Submit") {
                    print("Submit")
                }.buttonStyle(EvidenceButtonStyle(bgColor: .secondary, clipShape: .capsule))
            }
        }
    }
}
