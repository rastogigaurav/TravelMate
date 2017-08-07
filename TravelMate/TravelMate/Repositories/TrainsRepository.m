//
//  TrainsRepository.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "TrainsRepository.h"
#import "NetworkManager.h"
#import "Transport.h"

@implementation TrainsRepository

-(void)fetchTrains:(City *)source destination:(City *)destination completionHandler:(void (^)(NSMutableArray<Transport *> *))block{
    NSString *urlString = @"https://api.myjson.com/bins/3zmcy";
    
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
