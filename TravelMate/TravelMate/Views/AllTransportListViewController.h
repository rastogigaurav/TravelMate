//
//  AllTransportListViewController.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface AllTransportListViewController : UIViewController

@property (nonatomic, strong)City *source;
@property (nonatomic, strong)City *destination;

@end
