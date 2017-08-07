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
        if ([transportDictionary objectForKey:kTransport_ID]){
            self.transportId = [[transportDictionary objectForKey:kTransport_ID] intValue];
        }
        
        if ([transportDictionary objectForKey:kProvider_Logo]){
            self.providerLogo = [transportDictionary objectForKey:kProvider_Logo];
        }
        
        if ([transportDictionary objectForKey:kPrice_In_Euros]){
            self.priceInEuros = [transportDictionary objectForKey:kPrice_In_Euros];
        }
        
        if ([transportDictionary objectForKey:kDeparture_Time]){
            self.departureTime = [transportDictionary objectForKey:kDeparture_Time];
        }
        
        if ([transportDictionary objectForKey:kArrival_Time]){
            self.arrivalTime = [transportDictionary objectForKey:kArrival_Time];
        }
        
        if ([transportDictionary objectForKey:kArrival_Time]){
            self.nummberOfStops = [[transportDictionary objectForKey:kNummber_Of_Stops] intValue];
        }
    }
    
    return self;
}

@end
