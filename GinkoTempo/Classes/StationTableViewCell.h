//
//  StationTableViewCell.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>

@class Station;
@class StationTileView;


@interface StationTableViewCell : UITableViewCell {
	Station *station;
	UILabel *labelView;
}

@property (nonatomic,retain) Station *station;
@property (nonatomic,retain) UILabel *labelView;

- (void)setElement:(Station *)aStation;

@end
