//
//  ContainerViewController.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/7/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "City.h"

@interface ContainerViewController : UIViewController

@property (nonatomic, strong) City *source;
@property (nonatomic, strong) City *destination;

- (void)displayViewControllerForTransportMode:(TransportModes)mode;

- (void)sortOrderBy:(SortOptions)option;

@end
