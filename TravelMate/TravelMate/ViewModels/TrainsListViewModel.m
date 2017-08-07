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
    return [NSURL URLWithString:((Transport *)[self.trainsList objectAtIndex:indexPath.row]).providerLogo];
}

- (NSString *)priceAtIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"€ %@",((Transport *)[self.trainsList objectAtIndex:indexPath.row]).priceInEuros];
}

- (NSString *)trainTimingsAtIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"%@ - %@",((Transport *)[self.trainsList objectAtIndex:indexPath.row]).departureTime,((Transport *)[self.trainsList objectAtIndex:indexPath.row]).arrivalTime];
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

@end
