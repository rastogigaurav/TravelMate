//
//  TransportTest.swift
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

import XCTest

class TransportTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialization() {
        let transportDictionary:NSDictionary = NSDictionary(objects: [0,"logo.png","0.0","00:00:00","00:00:00",1], forKeys:
            [kTransport_ID as NSCopying,kProvider_Logo as NSCopying,kPrice_In_Euros as NSCopying,kArrival_Time as NSCopying,kDeparture_Time as NSCopying,kNummber_Of_Stops as NSCopying])
        let transport:Transport = Transport(dictionary: transportDictionary as! [AnyHashable : Any])
        XCTAssertEqual(transport.transportId, 0)
        XCTAssertEqual(transport.providerLogo, "logo.png")
        XCTAssertEqual(transport.priceInEuros, "0.0")
        XCTAssertEqual(transport.arrivalTime, "00:00:00")
        XCTAssertEqual(transport.departureTime, "00:00:00")
        XCTAssertEqual(transport.nummberOfStops, 1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
