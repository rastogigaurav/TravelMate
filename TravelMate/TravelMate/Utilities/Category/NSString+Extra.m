//
//  NSString+Extra.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/9/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)

+(NSString *)durationBetweenDepartureTime:(NSString *)departure andArrivalTime:(NSString *)arrival {
    int departureHours = [[[departure componentsSeparatedByString:@":"] firstObject] intValue];
    
    int departureMinutes = [[[departure componentsSeparatedByString:@":"] lastObject] intValue];
    
    int arrivalHours = [[[arrival componentsSeparatedByString:@":"] firstObject] intValue];
    
    int arrivalMinutes = [[[arrival componentsSeparatedByString:@":"] lastObject] intValue];
    
    int durationHours,durationMinutes;
    
    if (arrivalMinutes < departureMinutes){
        durationMinutes = (60 - departureMinutes) + arrivalMinutes;
        arrivalHours = arrivalHours - 1;
    }
    else{
        durationMinutes = arrivalMinutes - departureMinutes;
    }
    
    if (arrivalHours < departureHours){
        durationHours = (24 - departureHours) + arrivalHours;
    }
    else{
        durationHours = arrivalHours - departureHours;
    }
    
    return [NSString stringWithFormat:@"%02d:%02d h",durationHours,durationMinutes];
}

+(NSString *)timingsStringFromDepartureTime:(NSString *)departure andArrivalTime:(NSString *)arrival {
    int departureHours = [[[departure componentsSeparatedByString:@":"] firstObject] intValue];
    
    int arrivalHours = [[[arrival componentsSeparatedByString:@":"] firstObject] intValue];
    
    if (arrivalHours < departureHours){
        return [NSString stringWithFormat:@"%@ - %@ (+1)",departure,arrival];
    }
    
    return [NSString stringWithFormat:@"%@ - %@",departure,arrival];
}

-(NSComparisonResult)compareWithTime:(NSString *)otherObject {
    int hours = [[[self componentsSeparatedByString:@":"] firstObject] intValue];
    int minutes = [[[self componentsSeparatedByString:@":"] lastObject] intValue];
    
    int otherHours = [[[otherObject componentsSeparatedByString:@":"] firstObject] intValue];
    int otherMinutes = [[[otherObject componentsSeparatedByString:@":"] lastObject] intValue];
    
    if (hours < otherHours){
        return NSOrderedAscending;
    }
    else if (hours == otherHours && minutes < otherMinutes) {
        return NSOrderedAscending;
    }
    else if (hours == otherHours && minutes > otherMinutes) {
        return NSOrderedDescending;
    }
    else if (hours > otherHours){
        return NSOrderedDescending;
    }
    
    return NSOrderedSame;
}

@end
