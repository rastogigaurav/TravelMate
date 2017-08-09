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
#import "NSString+Extra.h"

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
    NSString *providerLogo = ((Transport *)[self.busesList objectAtIndex:indexPath.row]).providerLogo;
    
    return [NSURL URLWithString:[providerLogo stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"]];
}

- (NSString *)priceAtIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"€ %.2f",[((Transport *)[self.busesList objectAtIndex:indexPath.row]).priceInEuros floatValue]];
}

- (NSString *)busTimingsAtIndexPath:(NSIndexPath *)indexPath {
    NSString *departure = ((Transport *)[self.busesList objectAtIndex:indexPath.row]).departureTime;
    
    NSString *arrival = ((Transport *)[self.busesList objectAtIndex:indexPath.row]).arrivalTime;
    
    return [NSString timingsStringFromDepartureTime:departure andArrivalTime:arrival];
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

- (NSString *)timeDurationBetweenArrivalAndDepartureAtIndexPath:(NSIndexPath *)indexPath {
    NSString *departure = ((Transport *)[self.busesList objectAtIndex:indexPath.row]).departureTime;
    
    NSString *arrival = ((Transport *)[self.busesList objectAtIndex:indexPath.row]).arrivalTime;
    
    return [NSString durationBetweenDepartureTime:departure andArrivalTime:arrival];
}

-(void)fetchBusesBetweenSource:(City *)source andDestination:(City *)destination reload:(void (^)())block{
    [self.displayBuses displayBuses:source destination:destination completionHandler:^(NSMutableArray<Transport *> *result) {
        self.busesList = result;
        block();
    }];
}

- (void)sortOrderOfBusesByOption:(SortOptions)option reload:(void(^)())block {
    switch (option) {
        case arrivalTime:{
            [self.busesList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                Transport *transport1 = (Transport *)obj1;
                Transport *transport2 = (Transport *)obj2;
                
                return [transport1.arrivalTime compareWithTime:transport2.arrivalTime];
            }];
            break;
        }
        case departureTime:{
            [self.busesList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                Transport *transport1 = (Transport *)obj1;
                Transport *transport2 = (Transport *)obj2;
                
                return [transport1.departureTime compareWithTime:transport2.departureTime];
            }];
            break;
        }
        case duration:{
            [self.busesList sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
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
