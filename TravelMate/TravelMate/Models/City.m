//
//  City.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "City.h"

@implementation City

-(instancetype)initWithName:(NSString *)name andCode:(NSString *)code{
    self = [super init];
    
    if (self){
        self.name = name;
        self.code = code;
    }
    
    return self;
}

@end
