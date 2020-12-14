//
//  MainViewMenuItem.swift
//  EvidenceRoom
//
//  Created by Thomas Swatland on 06/11/2020.
//

import SwiftUI

struct MainViewMenuItem: View {
    
    let title: String
    
    let action: ()->()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(radius: 5)
            Text(title)
        }.onTapGesture {
            action()
        }
    }
}

struct MainViewMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MainViewMenuItem(title: "Title") {
            print("Tapped")
        }
    }
}
