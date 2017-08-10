//
//  TrainsListViewModelTest.swift
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/10/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

import XCTest

class DisplayTrainsMock: NSObject, DisplayTrainsProtocol {
    
    var displayTrainsCalled = false;
    
    func displayTrains(_ source:City!, destination:City!,completionHandler block: ((NSMutableArray?) -> Void)!) {
        self.displayTrainsCalled = true;
        block(nil)
    }
}


class TrainsListViewModelTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchTrains() {
        let displayTrainsMock:DisplayTrainsMock = DisplayTrainsMock()
        let viewModel:TrainsListViewModel = TrainsListViewModel(displayTrains:displayTrainsMock)
        viewModel.fetchTrainsBetweenSource(City(), andDestination: City()) { 
            XCTAssertTrue(displayTrainsMock.displayTrainsCalled)
        }
    }    
}
