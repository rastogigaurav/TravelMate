//
//  DisplayTrainsProtocol.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City,Transport;

@protocol DisplayTrainsProtocol <NSObject>

- (void)displayTrains:(City *)source destination:(City *)destination completionHandler:(void(^)(NSMutableArray<Transport *> *result))block;

@end
