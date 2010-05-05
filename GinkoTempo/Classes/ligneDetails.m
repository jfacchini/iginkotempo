//
//  ligneDetails.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 05/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ligneDetails.h"
#import "TempsAttentes.h"


@implementation ligneDetails

@synthesize temps;


- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
		temps = nil;
        
        self.opaque = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

+ (CGSize)preferredViewSize {
	return CGSizeMake(320,65);
}

- (void)drawRect:(CGRect)rect {

    
	CGPoint point;
	// get the image that represents the element physical state and draw it
    
	CGRect ligneColorRect = CGRectMake(15,9, 37, 37);
	
    //printf("%s\n", [ligne.numero cString]);
    
    [temps.ligne.couleurFond set];
    
    UIRectFill(ligneColorRect); // this will fill the upper rect all, 
	
	[temps.ligne.couleurTexte set];
    
    UIFont *font = [UIFont boldSystemFontOfSize:18];
    
	CGSize stringSize = [temps.ligne.numero sizeWithFont:font];
	point = CGPointMake((ligneColorRect.size.width-stringSize.width)/2+15,7+9);
	
	[temps.ligne.numero drawAtPoint:point withFont:font];
    
    [[UIColor blackColor] set];
    
    [temps.ligne.direction drawAtPoint:CGPointMake(63, 3+9) withFont:[UIFont boldSystemFontOfSize:24.0]];
    

    
}


- (void)dealloc {
    [temps release];
    [super dealloc];
}


@end
