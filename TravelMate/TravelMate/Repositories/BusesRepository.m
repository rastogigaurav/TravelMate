//
//  BusesRepository.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "BusesRepository.h"
#import "NetworkManager.h"
#import "Transport.h"

@implementation BusesRepository

-(void)fetchBuses:(City *)source destination:(City *)destination completionHandler:(void (^)(NSMutableArray<Transport *> *))block{
    NSString *urlString = @"https://api.myjson.com/bins/37yzm";
    
    [NetworkManager.sharedInstance get:urlString parameters:nil withSuccessBlock:^(NSArray *result) {
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        for (NSDictionary *transportDictionary in result){
            [resultArray addObject:[[Transport alloc] initWithDictionary:transportDictionary]];
        }
        block(resultArray);
    } andFailureBlock:^(NSError *error){
        NSLog(@"Error : %@",error);
    }];
}

@end
