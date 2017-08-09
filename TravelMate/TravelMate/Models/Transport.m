//
//  Transport.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "Transport.h"
#import "Constants.h"

@implementation Transport

- (instancetype)initWithDictionary:(NSDictionary *)transportDictionary {
    self = [super init];
    
    if (self && transportDictionary.count > 0){
        if ([transportDictionary valueForKey:kTransport_ID]){
            self.transportId = [[transportDictionary valueForKey:kTransport_ID] intValue];
        }
        
        if ([transportDictionary valueForKey:kProvider_Logo]){
            self.providerLogo = [transportDictionary valueForKey:kProvider_Logo];
        }
        
        if ([transportDictionary valueForKey:kPrice_In_Euros]){
            self.priceInEuros = [transportDictionary valueForKey:kPrice_In_Euros];
        }
        
        if ([transportDictionary valueForKey:kDeparture_Time]){
            self.departureTime = [transportDictionary valueForKey:kDeparture_Time];
        }
        
        if ([transportDictionary valueForKey:kArrival_Time]){
            self.arrivalTime = [transportDictionary valueForKey:kArrival_Time];
        }
        
        if ([transportDictionary valueForKey:kNummber_Of_Stops]){
            self.nummberOfStops = [[transportDictionary valueForKey:kNummber_Of_Stops] intValue];
        }
    }
    
    return self;
}

@end
