//
//  BusesListViewModel.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "BusesListViewModel.h"
#import "BusesRepository.h"
#import "DisplayBuses.h"
#import "Transport.h"

@interface BusesListViewModel()

@property (nonatomic, strong) id<DisplayBusesProtocol> displayBuses;
@property (nonatomic, strong) NSMutableArray *busesList;

@end

@implementation BusesListViewModel

+ (instancetype)create{
    BusesRepository *repository = [BusesRepository new];
    DisplayBuses *displayBuses = [[DisplayBuses alloc] initWithBusesRepository:repository];
    BusesListViewModel *viewModel = [[BusesListViewModel alloc] initWithDisplayBuses:displayBuses];
    
    return viewModel;
}

- (instancetype) initWithDisplayBuses:(id<DisplayBusesProtocol>)displayBuses{
    self = [super init];
    
    if (self){
        self.displayBuses = displayBuses;
    }
    
    return self;
}

- (NSUInteger )numberOfItemsInSection:(NSInteger )section {
    return self.busesList.count;
}

- (NSURL *)providerLogoUrlAtIndexPath:(NSIndexPath *)indexPath {
    return [NSURL URLWithString:((Transport *)[self.busesList objectAtIndex:indexPath.row]).providerLogo];
}

- (NSString *)priceAtIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"€ %@@",((Transport *)[self.busesList objectAtIndex:indexPath.row]).priceInEuros];
}

- (NSString *)trainTimingsAtIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"%@ - %@",((Transport *)[self.busesList objectAtIndex:indexPath.row]).departureTime,((Transport *)[self.busesList objectAtIndex:indexPath.row]).arrivalTime];
}

- (NSString *)numberOfStopsAtIndexPath:(NSIndexPath *)indexPath{
    
    int numberOfStop = ((Transport *)[self.busesList objectAtIndex:indexPath.row]).nummberOfStops;
    
    if (numberOfStop == 0) {
        return @"Direct";
    }
    else{
        return [NSString stringWithFormat:@"%d stops",numberOfStop];
    }
}

-(void)fetchBusesBetweenSource:(City *)source andDestination:(City *)destination reload:(void (^)())block{
    [self.displayBuses displayBuses:source destination:destination completionHandler:^(NSMutableArray<Transport *> *result) {
        self.busesList = result;
        block();
    }];
}

@end
