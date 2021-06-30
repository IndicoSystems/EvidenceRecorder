//
//  HomeView.swift
//  EvidenceRoom
//
//  Created by Thomas Swatland on 29/06/2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var appState = AppState.shared
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: TodayView()) {
                    Text("Today")
                }
                Divider()
                    .padding()
                NavigationLink(destination: RoomsView()) {
                    Text("Rooms")
                }
                Divider()
                    .padding()
//                NavigationLink(destination: CasesView()) {
//                    Text("Cases")
//                }
//                Divider()
//                    .padding()
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                }
            }
            .navigationTitle("Evidence")
            .navigationBarItems(trailing:
                Button {
                    CloudClient.shared.signOut {
                        DispatchQueue.main.async {
                            appState.isSignedOut = true
                        }
                    }
                    
//                    cloudClient.signOut { ft4Response in
//                        switch ft4Response.statusCode {
//                        case 200:
//                            UserDefaults.standard.setValue(nil, forKey: "token")
//                        default:
//                            print("Sign out failed with status:", ft4Response.statusCode)
//                        }
//                    }
                } label: {
                    Image(systemName: "icloud.and.arrow.down.fill")
                }
            )
            
            TodayView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
