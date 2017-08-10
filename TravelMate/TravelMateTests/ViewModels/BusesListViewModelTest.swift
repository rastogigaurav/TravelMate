//
//  BusesListViewModelTest.swift
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/10/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

import XCTest

class DisplayBusesMock: NSObject, DisplayBusesProtocol {
    var displayBusesCalled = false
    
    func displayBuses(_ source: City!, destination: City!, completionHandler block: ((NSMutableArray?) -> Void)!) {
        self.displayBusesCalled = true
        block(nil)
    }
}

class BusesListViewModelTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchBuses() {
        let displayBusesMock:DisplayBusesMock = DisplayBusesMock()
        let viewModel:BusesListViewModel = BusesListViewModel(displayBuses: displayBusesMock)
        viewModel.fetchBusesBetweenSource(City(), andDestination: City()) { 
            XCTAssertTrue(displayBusesMock.displayBusesCalled)
        }
    }
    
}
