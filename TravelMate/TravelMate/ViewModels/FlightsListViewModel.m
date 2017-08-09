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
#import "NSString+Extra.h"

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
    NSString *providerLogo = ((Transport *)[self.flightsList objectAtIndex:indexPath.row]).providerLogo;
    
    return [NSURL URLWithString:[providerLogo stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"]];
}

- (NSString *)priceAtIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"€ %.2f",[((Transport *)[self.flightsList objectAtIndex:indexPath.row]).priceInEuros floatValue]];
}

- (NSString *)flightTimingsAtIndexPath:(NSIndexPath *)indexPath {
    NSString *departure = ((Transport *)[self.flightsList objectAtIndex:indexPath.row]).departureTime;
    
    NSString *arrival = ((Transport *)[self.flightsList objectAtIndex:indexPath.row]).arrivalTime;
    
    return [NSString timingsStringFromDepartureTime:departure andArrivalTime:arrival];
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

- (NSString *)timeDurationBetweenArrivalAndDepartureAtIndexPath:(NSIndexPath *)indexPath {
    NSString *departure = ((Transport *)[self.flightsList objectAtIndex:indexPath.row]).departureTime;
    
    NSString *arrival = ((Transport *)[self.flightsList objectAtIndex:indexPath.row]).arrivalTime;
    
    return [NSString durationBetweenDepartureTime:departure andArrivalTime:arrival];
}

-(void)fetchFlightsBetweenSource:(City *)source andDestination:(City *)destination reload:(void (^)())block{
    [self.displayFlights displayFlights:source destination:destination completionHandler:^(NSMutableArray<Transport *> *result) {
        self.flightsList = result;
        block();
    }];
}

- (void)sortOrderOfFlightsByOption:(SortOptions)option reload:(void(^)())block {
    switch (option) {
        case arrivalTime:{
            [self.flightsList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                Transport *transport1 = (Transport *)obj1;
                Transport *transport2 = (Transport *)obj2;
                
                return [transport1.arrivalTime compareWithTime:transport2.arrivalTime];
            }];
            break;
        }
        case departureTime:{
            [self.flightsList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                Transport *transport1 = (Transport *)obj1;
                Transport *transport2 = (Transport *)obj2;
                
                return [transport1.departureTime compareWithTime:transport2.departureTime];
            }];
            break;
        }
        case duration:{
            [self.flightsList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
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
