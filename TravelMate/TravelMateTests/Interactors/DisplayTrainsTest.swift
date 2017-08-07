//
//  DisplayTrainsTest.swift
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

import XCTest

class TrainsRepositoryMock: NSObject, TrainsRepositoryProtocol {
    
    var fetchTrainsCalled = false;
    
    func fetchTrains(_ source: City!, destination: City!, completionHandler block: ((NSMutableArray?) -> Void)!) {
        self.fetchTrainsCalled = true
        block(nil)
    }    
}


class DisplayTrainsTest: XCTestCase {
    
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
        
        let repository:TrainsRepositoryMock = TrainsRepositoryMock()
        let displayTrains:DisplayTrains = DisplayTrains(trainsRepository: repository)
        
        let source = City()
        source.name = "Berlin"
        source.code = "bln"
        
        let destination = City()
        destination.name = "Munich"
        destination.code = "mnh"
        
        displayTrains.displayTrains(source, destination: destination) { (resultArray) in
            XCTAssertTrue(repository.fetchTrainsCalled)
            exp.fulfill()
        }
        
        // wait for expectations
        waitForExpectations(timeout: 2) { (error) in
            if let _ = error {
                XCTFail("Failed to display Trains between " + source.name + " and " + destination.name)
            }
        }
    }
    
    func testPerformanceExample() {
        let repository:TrainsRepositoryMock = TrainsRepositoryMock()
        let displayTrains:DisplayTrains = DisplayTrains(trainsRepository: repository)
        
        let source = City()
        source.name = "Berlin"
        source.code = "bln"
        
        let destination = City()
        destination.name = "Munich"
        destination.code = "mnh"
        
        self.measure {
            // Put the code you want to measure the time of here.
            displayTrains.displayTrains(source, destination: destination) { (resultArray) in
            }
        }
    }
}
