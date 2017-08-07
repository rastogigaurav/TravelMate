//
//  FlightsListViewController.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface FlightsListViewController : UITableViewController

@property (nonatomic, strong) City *sourceCity;
@property (nonatomic, strong) City *destinationCity;

@end
