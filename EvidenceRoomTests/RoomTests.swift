//
//  RoomTests.swift
//  EvidenceRoom
//
//  Created by Thomas Swatland on 24/02/2021.
//

import XCTest
@testable import EvidenceRoom

class RoomTests: XCTestCase {
    
    var apolloRoom: GetRoomsQuery.Data.Room!
    var apolloCam: GetRoomsQuery.Data.Room.Camera!
    var camera: Axis!
    var room: Room!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        apolloCam = GetRoomsQuery.Data.Room.Camera(id: UUID().uuidString, name: "Mock Camera", address: "10.0.0.83:8089", type: .axis)
        apolloCam.__typename = "Axis"
        apolloRoom = GetRoomsQuery.Data.Room(id: UUID().uuidString, name: "Mock Room", cameras: [apolloCam])
        room = Room(apolloRoom: apolloRoom)
        camera = Axis(apolloCam: apolloCam)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apolloRoom = nil
        apolloCam = nil
        room = nil
        camera = nil
        
        super.tearDown()
    }
    
    func testCameraExistsInRoom() {
        XCTAssertTrue(room.cameras.count > 0)
    }
    
    func testCameraHasStreamURL() {
        XCTAssertNotNil(room.cameras.first!.streamURL)
    }
    
    func testCameraHasServerURL() {
        print(room.cameras.first!.serverURL)
        XCTAssertNotNil(room.cameras.first!.serverURL)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
