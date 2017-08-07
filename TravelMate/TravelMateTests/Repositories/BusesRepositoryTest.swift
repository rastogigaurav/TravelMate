//
//  BusesRepositoryTest.swift
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

import XCTest

class BusesRepositoryTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchBuses() {
        let exp:XCTestExpectation = expectation(description: "Expected to get available flights between destination and source")
        
        let repository:BusesRepository = BusesRepository()
        
        let source = City()
        source.name = "Berlin"
        source.code = "bln"
        
        let destination = City()
        destination.name = "Munich"
        destination.code = "mnh"
        
        repository.fetchBuses(source, destination: destination) { (result) in
            XCTAssertNotNil(result)
            exp.fulfill()
        }
        
        // wait for expectations
        waitForExpectations(timeout: 2) { (error) in
            if let _ = error {
                XCTFail("Failed to fetch buses between " + source.name + " and " + destination.name)
            }
        }
    }
    
    func testPerformanceExample() {
        let repository:BusesRepository = BusesRepository()
        let source = City()
        let destination = City()

        self.measure {
            // Put the code you want to measure the time of here.
            repository.fetchBuses(source, destination: destination, completionHandler: { (resultArray) in
            })
        }
    }
    
}
