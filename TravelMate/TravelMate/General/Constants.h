//
//  Constants.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#define kTransport_ID @"id"
#define kProvider_Logo @"provider_logo"
#define kPrice_In_Euros @"price_in_euros"
#define kDeparture_Time @"departure_time"
#define kArrival_Time @"arrival_time"
#define kNummber_Of_Stops @"number_of_stops"

typedef NS_ENUM(NSInteger, TransportModes) {
    train,
    bus,
    flight
};

typedef NS_ENUM(NSInteger, SortOptions) {
    arrivalTime,
    departureTime,
    duration
};
