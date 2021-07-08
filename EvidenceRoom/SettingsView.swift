import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var appState = AppState.shared
    @State private var assignedRoom = "Room"
    
    var body: some View {
        Form {
            Section(header: Text("Assigned room")) {
                Picker(appState.assignedRoom?.name ?? "No assigned room", selection: $assignedRoom) {
                    ForEach(appState.rooms, id: \.id) { room in
                        Text(room.name)
                    }
                    .navigationTitle("Rooms")
                }
                .onChange(of: assignedRoom) { roomId in
                    UserDefaults.standard.setValue(roomId, forKey: "assignedRoomId")
                }
            }
            .navigationTitle(Text("Settings"))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
