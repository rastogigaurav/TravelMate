//
//  DisplayBuses.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusesRepositoryProtocol.h"
#import "DisplayBusesProtocol.h"

@interface DisplayBuses : NSObject <DisplayBusesProtocol>

+ (instancetype)new __attribute__((unavailable("use 'initWithBusesRepository:' instead")));
- (instancetype)init __attribute__((unavailable("use 'initWithBusesRepository:' instead")));

-(instancetype)initWithBusesRepository:(id<BusesRepositoryProtocol>)busesRepository;

@end
