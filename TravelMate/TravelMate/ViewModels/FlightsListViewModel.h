//
//  FlightsListViewModel.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DisplayFlightsProtocol.h"
#import "Constants.h"

@class Transport;

@interface FlightsListViewModel : NSObject

+ (instancetype)create;

- (instancetype) initWithDisplayFlights:(id<DisplayFlightsProtocol>)displayFlights;

- (NSUInteger )numberOfItemsInSection:(NSInteger )section;

- (NSURL *)providerLogoUrlAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)priceAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)flightTimingsAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)numberOfStopsAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)timeDurationBetweenArrivalAndDepartureAtIndexPath:(NSIndexPath *)indexPath;

- (void)fetchFlightsBetweenSource:(City *)source andDestination:(City *)destination reload:(void(^)())block;

- (void)sortOrderOfFlightsByOption:(SortOptions)option reload:(void(^)())block;

@end
