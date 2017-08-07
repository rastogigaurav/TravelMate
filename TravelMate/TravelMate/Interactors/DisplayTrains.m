//
//  DisplayTrains.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "DisplayTrains.h"

@interface DisplayTrains()

@property (nonatomic, strong) id<TrainsRepositoryProtocol> repository;

@end

@implementation DisplayTrains

-(instancetype)initWithTrainsRepository:(id<TrainsRepositoryProtocol>)trainsRepository{
    self = [super init];
    
    if (self)
        self.repository = trainsRepository;
    return self;
}

-(void)displayTrains:(City *)source destination:(City *)destination completionHandler:(void (^)(NSMutableArray<Transport *> *))block{
    [self.repository fetchTrains:source destination:destination completionHandler:^(NSMutableArray<Transport *> *result) {
        block(result);
    }];
}

@end
