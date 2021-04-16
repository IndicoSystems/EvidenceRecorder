import SwiftUI

struct SettingsView: View {
    
    private var cloudClient = CloudClient.shared
    @ObservedObject var appState = AppState.shared
    @State private var assignedRoom = "Room"
    
    var body: some View {
        Form {
            Section {
                Picker("Room", selection: $assignedRoom) {
                    ForEach(appState.rooms, id: \.id) { room in
                        Text(room.name)
                    }
                }.onChange(of: assignedRoom) { roomId in
                    UserDefaults.standard.setValue(roomId, forKey: "assignedRoomId")
                }
            }
        }
        .navigationTitle(Text("Settings"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
