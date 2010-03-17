//
//  LigneTileView.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TempsAttentes;

@interface TempsAttentesTileView : UIView {
    TempsAttentes *temps;
}

@property (nonatomic, retain) TempsAttentes *temps;

+ (CGSize)preferredViewSize;


@end
