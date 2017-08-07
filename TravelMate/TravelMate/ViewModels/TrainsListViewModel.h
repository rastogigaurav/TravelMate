//
//  TrainsListViewModel.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DisplayTrainsProtocol.h"

@interface TrainsListViewModel : NSObject

+ (instancetype)create;

- (instancetype) initWithDisplayTrains:(id<DisplayTrainsProtocol>)displayTrains;

- (NSUInteger )numberOfItemsInSection:(NSInteger )section;

- (NSURL *)providerLogoUrlAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)priceAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)trainTimingsAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)numberOfStopsAtIndexPath:(NSIndexPath *)indexPath;

- (void)fetchTrainsBetweenSource:(City *)source andDestination:(City *)destination reload:(void(^)())block;

@end
