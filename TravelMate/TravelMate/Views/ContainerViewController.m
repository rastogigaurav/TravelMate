//
//  ContainerViewController.m
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/7/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import "ContainerViewController.h"
#import "TrainsListViewController.h"
#import "BusesListViewController.h"
#import "FlightsListViewController.h"

#define SegueIdentifierTrains @"embedTrains"
#define SegueIdentifierBuses @"embedBuses"
#define SegueIdentifierFlights @"embedFlights"

@interface ContainerViewController ()

@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) TrainsListViewController *trainsListViewController;
@property (strong, nonatomic) BusesListViewController *busesListViewController;
@property (strong, nonatomic) FlightsListViewController *flightsListViewController;
@property (assign, nonatomic) BOOL transitionInProgress;

@end

@implementation ContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.transitionInProgress = NO;
    self.currentSegueIdentifier = SegueIdentifierTrains;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // Instead of creating new VCs on each seque we want to hang on to existing
    // instances if we have it. Remove the second condition of the following
    // two if statements to get new VC instances instead.
    if ([segue.identifier isEqualToString:SegueIdentifierTrains]) {
        self.trainsListViewController = segue.destinationViewController;
    }
    else if ([segue.identifier isEqualToString:SegueIdentifierBuses]) {
        self.busesListViewController = segue.destinationViewController;
    }
    else if ([segue.identifier isEqualToString:SegueIdentifierFlights]) {
        self.flightsListViewController = segue.destinationViewController;
    }
    
    // If we're going to the first view controller.
    if ([segue.identifier isEqualToString:SegueIdentifierTrains]) {
        // If this is not the first time we're loading this.
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.trainsListViewController];
        }
        else {
            // If this is the very first time we're loading this we need to do
            // an initial load and not a swap.
            [self addChildViewController:segue.destinationViewController];
            UIView* destView = ((UIViewController *)segue.destinationViewController).view;
            destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:destView];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    else if ([segue.identifier isEqualToString:SegueIdentifierBuses]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.busesListViewController];
    }
    else if ([segue.identifier isEqualToString:SegueIdentifierFlights]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.flightsListViewController];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}

- (void)sortOrderBy:(SortOptions)option {
    if ([self.currentSegueIdentifier isEqualToString:SegueIdentifierTrains]) {
        [self.trainsListViewController sortOrderBy:option];
    }
    else if ([self.currentSegueIdentifier isEqualToString:SegueIdentifierBuses]) {
        [self.busesListViewController sortOrderBy:option];
    }
    else if ([self.currentSegueIdentifier isEqualToString:SegueIdentifierFlights]) {
        [self.flightsListViewController sortOrderBy:option];
    }
}

- (void)displayViewControllerForTransportMode:(TransportModes)mode
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    if (self.transitionInProgress) {
        return;
    }
    
    switch (mode) {
        case train:
            self.currentSegueIdentifier = SegueIdentifierTrains;
            break;
        case bus:
            self.currentSegueIdentifier = SegueIdentifierBuses;
            break;
        case flight:
            self.currentSegueIdentifier = SegueIdentifierFlights;
            break;
    }
    
    self.transitionInProgress = YES;
    
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

@end

