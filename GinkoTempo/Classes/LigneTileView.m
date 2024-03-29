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
		ligne = nil;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
	CGPoint point;
	// get the image that represents the element physical state and draw it
    
	CGRect ligneColorRect = CGRectMake(0,0, 37, 37);
	
    //printf("%s\n", [ligne.numero cString]);
    
    [ligne.couleurFond set];
    
    UIRectFill(ligneColorRect); // this will fill the upper rect all, 
	
	[ligne.couleurTexte set];
    
    UIFont *font = [UIFont boldSystemFontOfSize:18];
    
	CGSize stringSize = [ligne.numero sizeWithFont:font];
	point = CGPointMake((ligneColorRect.size.width-stringSize.width)/2,7);
	
	[ligne.numero drawAtPoint:point withFont:font];
    
    
}

- (void)dealloc {
    [ligne release];
    [super dealloc];
}


@end
