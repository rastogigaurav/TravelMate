//
//  NetworkManager.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking.h>

@interface NetworkManager()

@property (nonatomic, strong) NSURLConnection *connection;

@end

@implementation NetworkManager

static NetworkManager *sharedInstance = nil;

+(instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [NetworkManager new];
    });
    
    return sharedInstance;
}

-(void)get:(NSString *)urlString parameters:(NSDictionary *)parameter withSuccessBlock:(SuccessBlock)success  andFailureBlock:(FailureBlock)failure {
    NSURL *URL = [NSURL URLWithString:urlString];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer new];
    manager.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    
    [manager GET:URL.absoluteString parameters:parameter progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if (responseObject != nil){
            success(responseObject);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failure(error);
    }];
}

@end
