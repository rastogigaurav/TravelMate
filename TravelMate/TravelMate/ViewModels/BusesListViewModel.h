//
//  BusesListViewModel.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DisplayBusesProtocol.h"

@interface BusesListViewModel : NSObject

+ (instancetype)create;

- (instancetype) initWithDisplayBuses:(id<DisplayBusesProtocol>)displayBuses;

- (NSUInteger )numberOfItemsInSection:(NSInteger )section;

- (NSURL *)providerLogoUrlAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)priceAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)trainTimingsAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)numberOfStopsAtIndexPath:(NSIndexPath *)indexPath;

- (void)fetchBusesBetweenSource:(City *)source andDestination:(City *)destination reload:(void(^)())block;

@end
