//
//  AllTransportListViewController.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/5/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "AllTransportListViewController.h"
#import "ContainerViewController.h"
#import "TrainsListViewController.h"
#import "BusesListViewController.h"
#import "FlightsListViewController.h"
#import "Constants.h"
#import "ActionSheetPicker.h"

@interface AllTransportListViewController ()

@property (nonatomic, strong) ContainerViewController *containerViewController;
@property (nonatomic) NSInteger selectedIndexOutOfSortOptions;

@end

@implementation AllTransportListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectedIndexOutOfSortOptions = 1;
    
    self.source = [[City alloc] initWithName:@"Berlin" andCode:@"BRL"];
    self.destination = [[City alloc] initWithName:@"Munich" andCode:@"MNC"];
    
    self.containerViewController.source = self.source;
    self.containerViewController.destination = self.destination;
    [self.navigationItem setTitle:[NSString stringWithFormat:@"%@ > %@",self.source.name,self.destination.name]];
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
    // Create an array of strings you want to show in the picker:
    NSArray *options = [NSArray arrayWithObjects:@"Arrival Time", @"Departure Time", @"Duration", nil];
    
    __weak AllTransportListViewController *weakSelf = self;
    
    [ActionSheetStringPicker showPickerWithTitle:@"Sort"
                                            rows:options
                                initialSelection:self.selectedIndexOutOfSortOptions
                                       doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           NSLog(@"Picker: %@, Index: %ld, value: %@",
                                                 picker, (long)selectedIndex, selectedValue);
                                           self.selectedIndexOutOfSortOptions = selectedIndex;
                                           [weakSelf.containerViewController sortOrderBy:selectedIndex];
                                       }
                                     cancelBlock:^(ActionSheetStringPicker *picker) {
                                         NSLog(@"Block Picker Canceled");
                                     }
                                          origin:sender];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
