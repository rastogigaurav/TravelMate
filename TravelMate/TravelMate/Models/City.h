//
//  City.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *code;

-(instancetype)initWithName:(NSString *)name andCode:(NSString *)code;

@end
