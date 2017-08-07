//
//  DisplayBusesTest.swift
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

import XCTest

class BusesRepositoryMock: NSObject, BusesRepositoryProtocol {
    
    var fetchBusesCalled = false;
    
    func fetchBuses(_ source: City!, destination: City!, completionHandler block: ((NSMutableArray?) -> Void)!) {
        self.fetchBusesCalled = true
        block(nil)
    } 
}

class DisplayBusesTest: XCTestCase {
    
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
        
        let repository:BusesRepositoryMock = BusesRepositoryMock()
        let displayBuses:DisplayBuses = DisplayBuses(busesRepository: repository)
        
        let source = City()
        source.name = "Berlin"
        source.code = "bln"
        
        let destination = City()
        destination.name = "Munich"
        destination.code = "mnh"
        
        displayBuses.displayBuses(source, destination: destination) { (resultArray) in
            XCTAssertTrue(repository.fetchBusesCalled)
            exp.fulfill()
        }
        
        // wait for expectations
        waitForExpectations(timeout: 2) { (error) in
            if let _ = error {
                XCTFail("Failed to display buses between " + source.name + " and " + destination.name)
            }
        }
    }
    
    func testPerformanceExample() {
        let repository:BusesRepositoryMock = BusesRepositoryMock()
        let displayBuses:DisplayBuses = DisplayBuses(busesRepository: repository)
        
        let source = City()
        source.name = "Berlin"
        source.code = "bln"
        
        let destination = City()
        destination.name = "Munich"
        destination.code = "mnh"
        
        self.measure {
            // Put the code you want to measure the time of here.
            displayBuses.displayBuses(source, destination: destination) { (resultArray) in
            }
        }
    }
    
}
