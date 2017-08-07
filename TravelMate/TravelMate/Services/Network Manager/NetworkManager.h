//
//  NetworkManager.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

typedef void (^ SuccessBlock)(NSArray *result);
typedef void (^ FailureBlock)(NSError *error);

+ (instancetype) sharedInstance;

- (void) get:(NSString *)urlString parameters:(NSDictionary *)parameter withSuccessBlock:(SuccessBlock )success  andFailureBlock:(FailureBlock)failure;

@end
