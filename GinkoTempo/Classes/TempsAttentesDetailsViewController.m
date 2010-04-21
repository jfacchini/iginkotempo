//
//  TempsAttentesDetails.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TempsAttentesDetailsViewController.h"


@implementation TempsAttentesDetailsViewController

@synthesize tempsAttente;
@synthesize viewGlobale;
@synthesize ligne1;
@synthesize ligne2;
@synthesize addremove;


- (id)initWithTempsAttentes:(TempsAttentes *)myTempsAttente
{    
    if([self init]) {
        
        self.title = @"Description";
        self.tempsAttente = myTempsAttente;
        
        self.viewGlobale = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        
    }
    
    return self;

}

- (void)loadView {
    
    ligne1.text = @"Ligne1";
    ligne1.font = [UIFont boldSystemFontOfSize:12.0];
    
    [viewGlobale addSubview:ligne1];

    
    ligne2.text = @"Ligne2";
    ligne2.font = [UIFont boldSystemFontOfSize:12.0];
    
    [viewGlobale addSubview:ligne2];
    
    
    self.view = viewGlobale;
}



- (void)dealloc {
    [super dealloc];
}


@end
