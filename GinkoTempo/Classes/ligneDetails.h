//
//  ligneDetails.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 05/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TempsAttentes;

@interface ligneDetails : UIView {
    TempsAttentes *temps;

}

@property (nonatomic, retain) TempsAttentes *temps;

+ (CGSize)preferredViewSize;

@end
