//
//  LigneTileView.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Ligne;

@interface LigneTileView : UIView {
    Ligne *ligne;
}

@property (nonatomic, retain) Ligne *ligne;

+ (CGSize)preferredViewSize;


@end
