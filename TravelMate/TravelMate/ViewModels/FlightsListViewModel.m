//
//  FlightsListViewModel.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "FlightsListViewModel.h"
#import "FlightsRepository.h"
#import "DisplayFlights.h"
#import "Transport.h"

@interface FlightsListViewModel()

@property (nonatomic, strong) id<DisplayFlightsProtocol> displayFlights;
@property (nonatomic, strong) NSMutableArray *flightsList;

@end

@implementation FlightsListViewModel

+ (instancetype)create{
    FlightsRepository *repository = [FlightsRepository new];
    DisplayFlights *displayFlights = [[DisplayFlights alloc] initWithFlightsRepository:repository];
    FlightsListViewModel *viewModel = [[FlightsListViewModel alloc] initWithDisplayFlights:displayFlights];
    
    return viewModel;
}

- (instancetype) initWithDisplayFlights:(id<DisplayFlightsProtocol>)displayFlights{
    self = [super init];
    
    if (self){
        self.displayFlights = displayFlights;
    }
    
    return self;
}

- (NSUInteger )numberOfItemsInSection:(NSInteger )section {
    return self.flightsList.count;
}

- (NSURL *)providerLogoUrlAtIndexPath:(NSIndexPath *)indexPath {
    return [NSURL URLWithString:((Transport *)[self.flightsList objectAtIndex:indexPath.row]).providerLogo];
}

- (NSString *)priceAtIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"€ %@",((Transport *)[self.flightsList objectAtIndex:indexPath.row]).priceInEuros];
}

- (NSString *)trainTimingsAtIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"%@ - %@",((Transport *)[self.flightsList objectAtIndex:indexPath.row]).departureTime,((Transport *)[self.flightsList objectAtIndex:indexPath.row]).arrivalTime];
}

- (NSString *)numberOfStopsAtIndexPath:(NSIndexPath *)indexPath{
    
    int numberOfStop = ((Transport *)[self.flightsList objectAtIndex:indexPath.row]).nummberOfStops;
    
    if (numberOfStop == 0) {
        return @"Direct";
    }
    else{
        return [NSString stringWithFormat:@"%d stops",numberOfStop];
    }
}

-(void)fetchFlightsBetweenSource:(City *)source andDestination:(City *)destination reload:(void (^)())block{
    [self.displayFlights displayFlights:source destination:destination completionHandler:^(NSMutableArray<Transport *> *result) {
        self.flightsList = result;
        block();
    }];
}

@end
