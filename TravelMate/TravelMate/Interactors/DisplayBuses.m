//
//  DisplayBuses.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "DisplayBuses.h"

@interface DisplayBuses()

@property (nonatomic, strong) id<BusesRepositoryProtocol> repository;

@end

@implementation DisplayBuses

-(instancetype)initWithBusesRepository:(id<BusesRepositoryProtocol>)busesRepository {
    self = [super init];
    
    if (self)
        self.repository = busesRepository;
    
    return self;
}

-(void)displayBuses:(City *)source destination:(City *)destination completionHandler:(void (^)(NSMutableArray<Transport *> *))block{
    [self.repository fetchBuses:source destination:destination completionHandler:^(NSMutableArray<Transport *> *result) {
        block(result);
    }];
}


@end
