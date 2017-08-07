//
//  TransportCustomTableViewCell.h
//  TravelMate
//
//  Created by Gaurav Rastogi on 8/6/17.
//  Copyright © 2017 Gaurav Rastogi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransportCustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *providerLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *timingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfStopLabel;
@property (weak, nonatomic) IBOutlet UILabel *travelTimeLabel;

@end
