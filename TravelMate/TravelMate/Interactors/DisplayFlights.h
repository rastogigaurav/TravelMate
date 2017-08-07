//
//  DisplayFlights.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DisplayFlightsProtocol.h"
#import "FlightsRepositoryProtocol.h"

@interface DisplayFlights : NSObject <DisplayFlightsProtocol>

+ (instancetype)new __attribute__((unavailable("use 'initWithFlightRepository:' instead")));
- (instancetype)init __attribute__((unavailable("use 'initWithFlightRepository:' instead")));

-(instancetype)initWithFlightsRepository:(id<FlightsRepositoryProtocol>)flightsRepository;

@end
