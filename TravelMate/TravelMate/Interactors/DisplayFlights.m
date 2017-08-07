//
//  DisplayFlights.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "DisplayFlights.h"

@interface DisplayFlights()

@property (nonatomic, strong) id<FlightsRepositoryProtocol> repository;

@end

@implementation DisplayFlights

-(instancetype)initWithFlightsRepository:(id<FlightsRepositoryProtocol>)flightsRepository{
    self = [super init];
    
    if (self)
        self.repository = flightsRepository;
    
    return self;
}

-(void)displayFlights:(City *)source destination:(City *)destination completionHandler:(void (^)(NSMutableArray<Transport *> *))block{
    [self.repository fetchFlights:source destination:destination completionHandler:^(NSMutableArray<Transport *> *result) {
        block(result);
    }];
}

@end
