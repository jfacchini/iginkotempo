//
//  StationTileView.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Station;

@interface StationTileView : UIView {
	Station *station;
}

@property (nonatomic, retain) Station *station;

+ (CGSize)preferredViewSize;

@end
