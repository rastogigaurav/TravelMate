//
//  FlightsRepository.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "FlightsRepository.h"
#import "NetworkManager.h"
#import "Transport.h"

@implementation FlightsRepository

- (void)fetchFlights:(City *)source destination:(City *)destination completionHandler:(void (^)(NSMutableArray<Transport *> *))block{
    NSString *urlString = @"https://api.myjson.com/bins/w60i";
    
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
