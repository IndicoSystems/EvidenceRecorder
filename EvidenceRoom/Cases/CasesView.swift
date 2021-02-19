//
//  CasesView.swift
//  EvidenceRoom
//
//  Created by Thomas Swatland on 10/02/2021.
//

import SwiftUI

struct CasesView: View {
    
    @ObservedObject var cloudClient = CloudClient.shared
    
    var body: some View {
        List {
            ForEach(cloudClient.cases, id: \.id) { c in
                Text(c.name)
            }
        }
        .onAppear {
            cloudClient.getCases()
        }
        .navigationTitle("Cases")
        
    }
}

struct CasesView_Previews: PreviewProvider {
    static var previews: some View {
        CasesView()
    }
}
