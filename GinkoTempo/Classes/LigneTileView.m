//
//  LigneTileView.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LigneTileView.h"

#import "Ligne.h"


@implementation LigneTileView

@synthesize ligne;

+ (CGSize)preferredViewSize {
	return CGSizeMake(37,37);
}


- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
		station = nil;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    /*
     CGPoint point;
     // get the image that represents the element physical state and draw it
     
     
     UIImage *backgroundImage = element.stateImageForAtomicElementTileView;
     CGRect elementSymbolRectangle = CGRectMake(0,0, [backgroundImage size].width, [backgroundImage size].height);
     [backgroundImage drawInRect:elementSymbolRectangle];
     
     [[UIColor whiteColor] set];
     
     // draw the element number
     UIFont *font = [UIFont boldSystemFontOfSize:11];
     point = CGPointMake(3,2);
     [[station.atomicNumber stringValue] drawAtPoint:point withFont:font];
     
     
     // draw the element symbol
     font = [UIFont boldSystemFontOfSize:18];
     CGSize stringSize = [station.symbol sizeWithFont:font];
     point = CGPointMake((elementSymbolRectangle.size.width-stringSize.width)/2,14);
     
     [station.symbol drawAtPoint:point withFont:font];
     */
    
}

- (void)dealloc {
    [super dealloc];
}


@end
