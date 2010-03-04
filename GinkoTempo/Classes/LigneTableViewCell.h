//
//  LignesTableViewCell.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>

@class Ligne;
@class LigneTileView;


@interface LigneTableViewCell : UITableViewCell {
    Ligne *ligne;
	LigneTileView *ligneTileView;
	UILabel *labelView;
}

@property (nonatomic,retain) Ligne *ligne;
@property (nonatomic,retain) LigneTileView *ligneTileView;
@property (nonatomic,retain) UILabel *labelView;

- (void)setElement:(Ligne *)aLigne;


@end
