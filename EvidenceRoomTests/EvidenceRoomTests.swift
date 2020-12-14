//
//  EvidenceRoomTests.swift
//  EvidenceRoomTests
//
//  Created by Thomas Swatland on 06/11/2020.
//

import XCTest

@testable import EvidenceRoom

class CameraTests: XCTestCase {
    
    var ip: String!
    var port: Int!
    var sut: AxisCamera!
        
    override func setUp() {
        super.setUp()
        
        ip = "10.0.0.83"
        port = 8089
        
        sut = AxisCamera(ip: ip, port: port)
    }
    
    override func tearDown() {
        ip = nil
        port = nil
        sut = nil
        
        super.tearDown()
    }
    
    func testInitCamera_setsUpCameraObject() {
        XCTAssertNotNil(sut)
    }
    
    func testStartRecording_startsRecordingSession() {
        sut.startRecording()
        
        XCTAssertEqual(sut.isRecording, true)
    }
    
    func testStopRecording_stopsRecordingSession() {
        sut.stopRecording()
        
        XCTAssertEqual(sut.isRecording, false)
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
