//
//  chargementView.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 01/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "chargementView.h"


@implementation chargementView

@synthesize activityIndicator;

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.opaque = YES;
        self.backgroundColor = [UIColor whiteColor];

        CGRect activityElement = CGRectMake(84,178, 25, 25);
        activityIndicator = [[[UIActivityIndicatorView alloc] initWithFrame:activityElement] autorelease];
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        
        //[activityIndicator startAnimating];
        [self addSubview: activityIndicator];
  
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Chargement
    // Laden : allemand
    // 载入中 : chinois simplifié
    // Cargando : Espagnol
    // Погрузка : russe
    // Arabe : تحميل

//    CABasicAnimation *theAnimation;	
//    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
//    theAnimation.duration=1;
//    theAnimation.repeatCount=2;
//    theAnimation.autoreverses=YES;
//    theAnimation.fromValue=[NSNumber numberWithFloat:0];
//    theAnimation.toValue=[NSNumber numberWithFloat:-60];
//    [view.layer addAnimation:theAnimation forKey:@"animateLayer"];
//    
    
    CGSize stringSize = [@"CHARGEMENT" sizeWithFont:[UIFont boldSystemFontOfSize:16.0]];
    
    [@"CHARGEMENT" drawAtPoint:CGPointMake((320-stringSize.width+40)/2,180) withFont:[UIFont boldSystemFontOfSize:16.0]];
    
    [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1] set];
    
    [@"Chargement" drawAtPoint:CGPointMake(30,60) withFont:[UIFont boldSystemFontOfSize:18.0]];
    [@"Cargando" drawAtPoint:CGPointMake(150,10) withFont:[UIFont boldSystemFontOfSize:12.0]];
    [@"Loading" drawAtPoint:CGPointMake(80,280) withFont:[UIFont boldSystemFontOfSize:14.0]];
    [@"Laden" drawAtPoint:CGPointMake(250,60) withFont:[UIFont boldSystemFontOfSize:10.0]];
    [@"载入中" drawAtPoint:CGPointMake(140,280) withFont:[UIFont boldSystemFontOfSize:68.0]];
    
    [@"تحميل" drawAtPoint:CGPointMake(10,310) withFont:[UIFont boldSystemFontOfSize:18.0]];
    [@"Погрузка" drawAtPoint:CGPointMake(180,120) withFont:[UIFont boldSystemFontOfSize:14.0]];

   
}


- (void)dealloc {
    [super dealloc];
}


@end
