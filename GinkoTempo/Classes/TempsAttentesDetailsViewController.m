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
        
        self.addremove = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        self.addremove.titleLabel.text = @"Bouton";
        self.addremove.font = [UIFont systemFontOfSize:16];
    }
    
    return self;

}

- (void)loadView {

    self.ligne1.text = @"Ligne1";
    self.ligne1.font = [UIFont boldSystemFontOfSize:12.0];
    
    [self.viewGlobale addSubview:self.ligne1];

    
    self.ligne2.text = @"Ligne2";
    self.ligne2.font = [UIFont boldSystemFontOfSize:12.0];
    
    [self.viewGlobale addSubview:self.ligne2];
    
    [self.viewGlobale addSubview:self.addremove];
    
    self.view = viewGlobale;
}



- (void)dealloc {
    [super dealloc];
}


@end
