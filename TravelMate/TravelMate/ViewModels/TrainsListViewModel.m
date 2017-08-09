//
//  TrainsListViewModel.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "TrainsListViewModel.h"
#import "TrainsRepository.h"
#import "DisplayTrains.h"
#import "City.h"
#import "Constants.h"
#import "Transport.h"
#import "NSString+Extra.h"

@interface TrainsListViewModel()

@property (nonatomic, strong) id<DisplayTrainsProtocol> displayTrains;
@property (nonatomic, strong) NSMutableArray *trainsList;

@end

@implementation TrainsListViewModel

+ (instancetype)create{
    TrainsRepository *repository = [TrainsRepository new];
    DisplayTrains *displayTrains = [[DisplayTrains alloc] initWithTrainsRepository:repository];
    TrainsListViewModel *viewModel = [[TrainsListViewModel alloc] initWithDisplayTrains:displayTrains];
    
    return viewModel;
}

- (instancetype) initWithDisplayTrains:(id<DisplayTrainsProtocol>)displayTrains{
    self = [super init];
    
    if (self){
        self.displayTrains = displayTrains;
    }
    
    return self;
}

- (NSUInteger )numberOfItemsInSection:(NSInteger )section {
    return self.trainsList.count;
}

- (NSURL *)providerLogoUrlAtIndexPath:(NSIndexPath *)indexPath {
    NSString *providerLogo = ((Transport *)[self.trainsList objectAtIndex:indexPath.row]).providerLogo;
    
    return [NSURL URLWithString:[providerLogo stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"]];
}

- (NSString *)priceAtIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"€ %.2f",[((Transport *)[self.trainsList objectAtIndex:indexPath.row]).priceInEuros floatValue]];
}

- (NSString *)trainTimingsAtIndexPath:(NSIndexPath *)indexPath {
    NSString *departure = ((Transport *)[self.trainsList objectAtIndex:indexPath.row]).departureTime;
    
    NSString *arrival = ((Transport *)[self.trainsList objectAtIndex:indexPath.row]).arrivalTime;
    
    return [NSString timingsStringFromDepartureTime:departure andArrivalTime:arrival];
}

- (NSString *)timeDurationBetweenArrivalAndDepartureAtIndexPath:(NSIndexPath *)indexPath {
    NSString *departure = ((Transport *)[self.trainsList objectAtIndex:indexPath.row]).departureTime;
    
    NSString *arrival = ((Transport *)[self.trainsList objectAtIndex:indexPath.row]).arrivalTime;
    
    return [NSString durationBetweenDepartureTime:departure andArrivalTime:arrival];
}

- (NSString *)numberOfStopsAtIndexPath:(NSIndexPath *)indexPath{
    int numberOfStop = ((Transport *)[self.trainsList objectAtIndex:indexPath.row]).nummberOfStops;
    
    if (numberOfStop == 0) {
        return @"Direct";
    }
    else{
        return [NSString stringWithFormat:@"%d stops",numberOfStop];
    }
}

-(void)fetchTrainsBetweenSource:(City *)source andDestination:(City *)destination reload:(void (^)())block{
    [self.displayTrains displayTrains:source destination:destination completionHandler:^(NSMutableArray<Transport *> *result) {
        self.trainsList = result;
        block();
    }];

}

- (void)sortOrderOfTrainsByOption:(SortOptions)option reload:(void(^)())block {
    switch (option) {
        case arrivalTime:{
            [self.trainsList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                Transport *transport1 = (Transport *)obj1;
                Transport *transport2 = (Transport *)obj2;
                
                return [transport1.arrivalTime compareWithTime:transport2.arrivalTime];
            }];
            break;
        }
        case departureTime:{
            [self.trainsList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                Transport *transport1 = (Transport *)obj1;
                Transport *transport2 = (Transport *)obj2;
                
                return [transport1.departureTime compareWithTime:transport2.departureTime];
            }];
            break;
        }
        case duration:{
            [self.trainsList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                Transport *transport1 = (Transport *)obj1;
                Transport *transport2 = (Transport *)obj2;
                
                NSString *durationTransport1 = [NSString durationBetweenDepartureTime:transport1.departureTime andArrivalTime:transport1.arrivalTime];
                
                NSString *durationTransport2 = [NSString durationBetweenDepartureTime:transport2.departureTime andArrivalTime:transport2.arrivalTime];
                
                return [durationTransport1 compareWithTime:durationTransport2];
            }];
            break;
        }
    }
    block();
}

@end
