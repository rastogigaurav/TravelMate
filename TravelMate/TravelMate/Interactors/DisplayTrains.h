//
//  DisplayTrains.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DisplayTrainsProtocol.h"
#import "TrainsRepositoryProtocol.h"

@interface DisplayTrains : NSObject <DisplayTrainsProtocol>

+ (instancetype)new __attribute__((unavailable("use 'initWithTrainsRepository:' instead")));
- (instancetype)init __attribute__((unavailable("use 'initWithTrainsRepository:' instead")));

-(instancetype)initWithTrainsRepository:(id<TrainsRepositoryProtocol>)trainsRepository;

@end
