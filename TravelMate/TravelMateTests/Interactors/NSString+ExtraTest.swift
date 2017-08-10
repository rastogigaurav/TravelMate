//
//  NSString+ExtraTest.swift
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/10/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

import XCTest

class NSString_ExtraTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCompare() {
        let time:String = "00:00"
        let otherTime:String = "01:00"
        XCTAssertEqual(time.compare(withTime: otherTime), ComparisonResult.orderedAscending)
    }
    
    func testTimingStringIncludesNextDay() {
        let departure = "23:30"
        let arrival = "2:30"
        
        XCTAssertEqual(NSString.timingsString(fromDepartureTime: departure, andArrivalTime: arrival), "23:30 - 2:30 (+1)")
    }
    
    func testTimingStringDoesNotIncludesNextDay() {
        let departure = "2:30"
        let arrival = "4:30"
        
        XCTAssertEqual(NSString.timingsString(fromDepartureTime: departure, andArrivalTime: arrival), "2:30 - 4:30")
    }
    
    func testDurationBetweenDepartureAndArrival() {
        let departure = "2:30"
        let arrival = "4:30"
        
        XCTAssertEqual(NSString.durationBetweenDepartureTime(departure, andArrivalTime: arrival), "02:00 h")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
