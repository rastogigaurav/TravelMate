//
//  Transport.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transport : NSObject

@property (nonatomic, assign) int transportId;
@property (nonatomic, strong) NSString *providerLogo;
@property (nonatomic, assign) NSString *priceInEuros;
@property (nonatomic, assign) NSString *arrivalTime;
@property (nonatomic, assign) NSString *departureTime;
@property (nonatomic, assign) int nummberOfStops;

- (instancetype)initWithDictionary:(NSDictionary *)transportDictionary;

@end
