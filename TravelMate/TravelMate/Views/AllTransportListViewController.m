//
//  AllTransportListViewController.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "AllTransportListViewController.h"
#import "AllTransportListViewModel.h"
#import "ContainerViewController.h"
#import "TrainsListViewController.h"
#import "BusesListViewController.h"
#import "FlightsListViewController.h"
#import "Constants.h"
#import <ActionSheetPicker.h>

@interface AllTransportListViewController ()

@property (nonatomic, strong) AllTransportListViewModel *viewModel;
@property (nonatomic, strong) ContainerViewController *containerViewController;

@end

@implementation AllTransportListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self bindViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions -
- (IBAction)didSelectSegment:(UISegmentedControl *)sender {
    [self.containerViewController displayViewControllerForTransportMode:sender.selectedSegmentIndex];
}

- (IBAction)didTapSortOrder:(UIBarButtonItem *)sender {
    [ActionSheetStringPicker showPickerWithTitle:@"Sort Order" rows:[NSArray arrayWithObjects:@"Arrival Time",@"Departure Time",@"Duration", nil] initialSelection:1 target:self successAction:@selector(successMethod) cancelAction:@selector(cancelMethod) origin:sender];
}

-(void)successMethod{
}

-(void)cancelMethod{
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
    }
}

#pragma mark - Private Methods -
-(void)bindViewModel {
    self.viewModel = [AllTransportListViewModel new];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
