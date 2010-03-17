//
//  TempsAttentesTableViewCell.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>

@class TempsAttentes;
@class TempsAttentesTileView;


@interface TempsAttentesTableViewCell : UITableViewCell {
	TempsAttentes *temps;
    TempsAttentesTileView *ligneTileView;
}

@property (nonatomic,retain) TempsAttentes *temps;
@property (nonatomic,retain) TempsAttentesTileView *ligneTileView;
@property (nonatomic,retain) NSString *horaire1;
@property (nonatomic,retain) NSString *horaire2;

- (void)setElement:(TempsAttentes *)aTemps;

@end
