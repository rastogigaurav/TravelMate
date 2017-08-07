//
//  DisplayFlightsTest.swift
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

import XCTest

class FlightsRepositoryMock: NSObject, FlightsRepositoryProtocol {
    
    var fetchFlightsCalled = false;
    
    func fetchFlights(_ source: City!, destination: City!, completionHandler block: ((NSMutableArray?) -> Void)!) {
        self.fetchFlightsCalled = true
        block(nil)
    }
}

class DisplayFlightsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDisplayFlights() {
        let exp:XCTestExpectation = expectation(description: "Expected to display available flights between destination and source")
        
        let repository:FlightsRepositoryMock = FlightsRepositoryMock()
        let displayFlights:DisplayFlights = DisplayFlights(flightsRepository: repository)
        
        let source = City()
        source.name = "Berlin"
        source.code = "bln"
        
        let destination = City()
        destination.name = "Munich"
        destination.code = "mnh"
        
        displayFlights.displayFlights(source, destination: destination) { (resultArray) in
            XCTAssertTrue(repository.fetchFlightsCalled)
            exp.fulfill()
        }
        
        // wait for expectations
        waitForExpectations(timeout: 2) { (error) in
            if let _ = error {
                XCTFail("Failed to display flights between " + source.name + " and " + destination.name)
            }
        }
    }
    
    func testPerformanceExample() {
        let repository:FlightsRepositoryMock = FlightsRepositoryMock()
        let displayFlights:DisplayFlights = DisplayFlights(flightsRepository: repository)
        
        let source = City()
        source.name = "Berlin"
        source.code = "bln"
        
        let destination = City()
        destination.name = "Munich"
        destination.code = "mnh"
        
        self.measure {
            // Put the code you want to measure the time of here.
            displayFlights.displayFlights(source, destination: destination) { (resultArray) in
            }
        }
    }
    
}
