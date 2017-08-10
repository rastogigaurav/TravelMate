//
//  TrainsListViewController.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "TrainsListViewController.h"
#import "TrainsListViewModel.h"
#import "TransportCustomTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TrainsListViewController ()

@property (nonatomic, strong) TrainsListViewModel *viewModel;

@end

@implementation TrainsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewModel];
    [self.viewModel fetchTrainsBetweenSource:self.sourceCity andDestination:self.destinationCity reload:^{
        [self.viewModel sortOrderOfTrainsByOption:departureTime reload:^{
            [self.tableView reloadData];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sortOrderBy:(SortOptions )option {
    [self.viewModel sortOrderOfTrainsByOption:option reload:^{
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }];
}

#pragma mark - Private Methods -
-(void)setupViewModel {
    self.viewModel = [TrainsListViewModel create];
}

- (void)configureCell:(TransportCustomTableViewCell * )cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [cell.providerLogoImageView sd_setImageWithURL:[self.viewModel providerLogoUrlAtIndexPath:indexPath] placeholderImage:[UIImage imageNamed:@"train"]];
    [cell.priceLabel setText:[self.viewModel priceAtIndexPath:indexPath]];
    [cell.timingsLabel setText:[self.viewModel trainTimingsAtIndexPath:indexPath]];
    [cell.numberOfStopLabel setText:[self.viewModel numberOfStopsAtIndexPath:indexPath]];
    [cell.travelTimeLabel setText:[self.viewModel timeDurationBetweenArrivalAndDepartureAtIndexPath:indexPath]];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TransportCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TransportCustomTableViewCell class]) forIndexPath:indexPath];
    
    if (cell == nil){
        cell = [[TransportCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([TransportCustomTableViewCell class])];
    }
    
    // Configure the cell...
    [self configureCell:cell forItemAtIndexPath:indexPath];
    
    return cell;
}

@end
