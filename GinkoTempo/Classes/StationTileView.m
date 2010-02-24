//
//  StationTileView.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StationTileView.h"

#import "Station.h"


@implementation StationTileView
@synthesize station;

+ (CGSize)preferredViewSize {
	return CGSizeMake(37,37);
}


- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
		station = nil;
    }
    
    return self;
}


// Permet d'afficher un logo à gauche dans la ligne. Peut être utile pour
// afficher la ligne de façon plus visuelle avec entre autre un carré
// de couleur.

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
	[station release];
	[super dealloc];
}


@end
