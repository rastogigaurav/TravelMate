//
//  FlightsListViewModelTest.swift
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/10/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

import XCTest

class DisplayFlightsMock: NSObject, DisplayFlightsProtocol {
    var displayFlightsCalled = false
    
    func displayFlights(_ source: City!, destination: City!, completionHandler block: ((NSMutableArray?) -> Void)!) {
        self.displayFlightsCalled = true
        block(nil)
    }
}

class FlightsListViewModelTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchFlights() {
        let displayFlightsMock:DisplayFlightsMock = DisplayFlightsMock()
        let viewModel:FlightsListViewModel = FlightsListViewModel(displayFlights: displayFlightsMock)
        viewModel.fetchFlightsBetweenSource(City(), andDestination: City()) { 
            XCTAssertTrue(displayFlightsMock.displayFlightsCalled)
        }
    }
    
}
