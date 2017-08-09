//
//  BusesListViewController.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
#import "Constants.h"

@interface BusesListViewController : UITableViewController

@property (nonatomic, strong) City *sourceCity;
@property (nonatomic, strong) City *destinationCity;

- (void)sortOrderBy:(SortOptions)option;

@end
