//
//  FlightsRepositoryTest.swift
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

import XCTest

class FlightsRepositoryTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchFlights() {
        let exp:XCTestExpectation = expectation(description: "Expected to get available flights between destination and source")
        
        let repository:FlightsRepository = FlightsRepository()
        
        let source = City()
        source.name = "Berlin"
        source.code = "bln"
        
        let destination = City()
        destination.name = "Munich"
        destination.code = "mnh"
        
        repository.fetchFlights(source, destination: destination, completionHandler: { (resultArray) in
            exp.fulfill()
        })
        
        // wait for expectations
        waitForExpectations(timeout: 2) { (error) in
            if let _ = error {
                XCTFail("Failed to fetch flights between " + source.name + " and " + destination.name)
            }
        }
    }
    
    func testPerformanceExample() {
        let repository:FlightsRepository = FlightsRepository()
        let source = City()
        let destination = City()
        
        self.measure {
            // Put the code you want to measure the time of here.
            repository.fetchFlights(source, destination: destination, completionHandler: { (resultArray) in
            })
        }
    }
    
}
