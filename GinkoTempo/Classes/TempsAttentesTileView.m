//
//  LigneTileView.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TempsAttentesTileView.h"

#import "TempsAttentes.h"


@implementation TempsAttentesTileView

@synthesize temps;

+ (CGSize)preferredViewSize {
	return CGSizeMake(320,50);
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
		temps = nil;
        
        self.opaque = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
	CGPoint point;
	// get the image that represents the element physical state and draw it
    
	CGRect ligneColorRect = CGRectMake(10,9, 37, 37);
	
    //printf("%s\n", [ligne.numero cString]);
    
    [temps.ligne.couleurFond set];
    
    UIRectFill(ligneColorRect); // this will fill the upper rect all, 
	
	[temps.ligne.couleurTexte set];
    
    UIFont *font = [UIFont boldSystemFontOfSize:18];
    
	CGSize stringSize = [temps.ligne.numero sizeWithFont:font];
	point = CGPointMake((ligneColorRect.size.width-stringSize.width)/2+10,7+9);
	
	[temps.ligne.numero drawAtPoint:point withFont:font];

    [[UIColor blackColor] set];

    [temps.ligne.direction drawAtPoint:CGPointMake(58, 3) withFont:[UIFont boldSystemFontOfSize:17.0]];

    [temps.horaire1 drawAtPoint:CGPointMake(60, 30) withFont:[UIFont boldSystemFontOfSize:17.0]];
    [temps.horaire2 drawAtPoint:CGPointMake(180, 30) withFont:[UIFont boldSystemFontOfSize:17.0]];

    

    
}

- (void)dealloc {
    [temps release];
    [super dealloc];
}


@end
