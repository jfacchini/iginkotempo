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

        CGRect activityElement = CGRectMake(320/2-20,140, 40, 40);
        activityIndicator = [[[UIActivityIndicatorView alloc] initWithFrame:activityElement] autorelease];
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        
        //[activityIndicator startAnimating];
        [self addSubview: activityIndicator];
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGSize stringSize = [@"Chargement" sizeWithFont:[UIFont boldSystemFontOfSize:21.0]];
    
    CGPoint point = CGPointMake((320-stringSize.width)/2,200);
    

    //[@"Chargement" drawAtPoint:point withFont:[UIFont boldSystemFontOfSize:21.0]];
    
}


- (void)dealloc {
    [super dealloc];
}


@end
