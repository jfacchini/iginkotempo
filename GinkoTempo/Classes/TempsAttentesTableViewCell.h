//
//  TempsAttentesTableViewCell.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>

@class TempsAttentes;
@class LigneTileView;


@interface TempsAttentesTableViewCell : UITableViewCell {
	TempsAttentes *temps;
    LigneTileView *ligneTileView;
	UILabel *labelView;
}

@property (nonatomic,retain) TempsAttentes *temps;
@property (nonatomic,retain) LigneTileView *ligneTileView;
@property (nonatomic,retain) UILabel *labelView;

- (void)setElement:(TempsAttentes *)aTemps;

@end
