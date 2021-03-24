import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var cloudClient = CloudClient.shared
    @State private var assignedRoom = "Room"
    
    var body: some View {
        Form {
            Section {
                Picker("Room", selection: $assignedRoom) {
                    ForEach(cloudClient.rooms, id: \.id) { room in
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
