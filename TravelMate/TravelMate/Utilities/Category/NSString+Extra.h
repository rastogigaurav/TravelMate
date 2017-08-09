//
//  NSString+Extra.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/9/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extra)

+(NSString *)durationBetweenDepartureTime:(NSString *)departure andArrivalTime:(NSString *)arrival;

+(NSString *)timingsStringFromDepartureTime:(NSString *)departure andArrivalTime:(NSString *)arrival;

-(NSComparisonResult)compareWithTime:(NSString *)otherObject;

@end
