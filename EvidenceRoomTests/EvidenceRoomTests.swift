//
//  EvidenceRoomTests.swift
//  EvidenceRoomTests
//
//  Created by Thomas Swatland on 06/11/2020.
//

import XCTest

@testable import EvidenceRoom

class CameraTests: XCTestCase {
    
    var sut: Axis!
        
    override func setUp() {
        super.setUp()
        
        sut = Axis(apolloCam: GetRoomsQuery.Data.Room.Camera(id: UUID().uuidString, name: "Mock Camera", address: "10.0.0.83:8089"))
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testInitCamera_setsUpCameraObject() {
        XCTAssertNotNil(sut)
    }
    
    func testStartRecording_startsRecordingSession() {
//        sut.startRecording()
//
//        XCTAssertEqual(sut.isRecording, true)
    }
    
    func testStopRecording_stopsRecordingSession() {
//        sut.stopRecording()
//        
//        XCTAssertEqual(sut.isRecording, false)
    }
}

class CameraNetworkingClientTests: XCTestCase {
    
    var url: URL!
    
    var sut: CameraNetworkingClient!
    
    override func setUp() {
        super.setUp()
        
        url = URL(string: "https://10.0.0.83")
        sut = CameraNetworkingClient()
    }
    
    override func tearDown() {
        url = nil
        sut = nil
        
        super.tearDown()
    }
    
    func testInitCameraNetworkingClient_setsUpCameraNetworkingClient() {
        XCTAssertNotNil(sut)
    }    
}
