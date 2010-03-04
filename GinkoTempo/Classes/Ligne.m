//
//  Ligne.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Ligne.h"


@implementation Ligne

@synthesize ident;
@synthesize numero;
@synthesize direction;
@synthesize sens;
@synthesize couleurTexte;
@synthesize couleurFond;

- (id)initWithIdent:(NSNumber *)anIdent
     initWithNumero:(NSString *)aNumero 
           withSens:(NSString *)aSens 
      withDirection:(NSString *)aDirection 
     withColorLabel:(UIColor *)aColorLabel 
withColorBackground:(UIColor *)aColorBackground
{
	if ([self init]) {
        self.ident         = anIdent;
		self.numero        = aNumero;
		self.direction     = aDirection;
		self.sens          = aSens;
		self.couleurTexte  = aColorLabel;
		self.couleurFond   = aColorBackground;
	}
	return self;
}

- (void)dealloc {
	[ident release];
	[numero release];
	[direction release];
	[couleurTexte release];
	[couleurFond release];
    [super dealloc];
}

@end
