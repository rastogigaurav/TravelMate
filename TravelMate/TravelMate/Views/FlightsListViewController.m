//
//  FlightsListViewController.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "FlightsListViewController.h"
#import "FlightsListViewModel.h"
#import "TransportCustomTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FlightsListViewController ()

@property (nonatomic, strong) FlightsListViewModel *viewModel;

@end

@implementation FlightsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewModel];
    [self.viewModel fetchFlightsBetweenSource:self.sourceCity andDestination:self.destinationCity reload:^{
        [self sortOrderBy:departureTime];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sortOrderBy:(SortOptions )option {
    [self.viewModel sortOrderOfFlightsByOption:option reload:^{
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }];
}

#pragma mmark - Private Methods -

-(void)setupViewModel {
    self.viewModel = [FlightsListViewModel create];
}

- (void)configureCell:(TransportCustomTableViewCell * )cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [cell.providerLogoImageView sd_setImageWithURL:[self.viewModel providerLogoUrlAtIndexPath:indexPath] placeholderImage:[UIImage imageNamed:@"flight"]];
    [cell.priceLabel setText:[self.viewModel priceAtIndexPath:indexPath]];
    [cell.timingsLabel setText:[self.viewModel flightTimingsAtIndexPath:indexPath]];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
