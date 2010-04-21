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
	return CGSizeMake(320,65);
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
    
    [[[UIColor alloc] initWithRed:0.9 green:0.9 blue:0.9 alpha:0.3] set];
    
    [temps.station.name drawAtPoint:CGPointMake(40, 38) withFont:[UIFont boldSystemFontOfSize:30.0]];

    
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

    [temps.ligne.direction drawAtPoint:CGPointMake(58, 6) withFont:[UIFont boldSystemFontOfSize:17.0]];

    if ([temps.direction1 compare:temps.ligne.direction]) {
        [temps.direction1 drawAtPoint:CGPointMake(80, 29) withFont:[UIFont boldSystemFontOfSize:10.0]];
        [temps.horaire1 drawAtPoint:CGPointMake(80, 43) withFont:[UIFont boldSystemFontOfSize:14.0]];
    }else{
        [temps.horaire1 drawAtPoint:CGPointMake(80, 35) withFont:[UIFont boldSystemFontOfSize:16.0]];
    }
    
    [[[UIColor alloc] initWithRed:0.5 green:0.5 blue:0.5 alpha:1] set];
        
    if ([temps.direction2 compare:temps.ligne.direction]) {
        [temps.direction2 drawAtPoint:CGPointMake(200, 29) withFont:[UIFont boldSystemFontOfSize:10.0]];
        [temps.horaire2 drawAtPoint:CGPointMake(200, 43) withFont:[UIFont boldSystemFontOfSize:14.0]];

    }else {
        [temps.horaire2 drawAtPoint:CGPointMake(200, 35) withFont:[UIFont boldSystemFontOfSize:16.0]];

    }

    
    
}

- (void)dealloc {
    [temps release];
    [super dealloc];
}


@end
