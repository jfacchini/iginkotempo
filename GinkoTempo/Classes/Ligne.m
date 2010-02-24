//
//  Ligne.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Ligne.h"


@implementation Ligne

@synthesize numero;
@synthesize direction;
@synthesize couleur;

- (id)initWithNumero:(NSNumber *)aNumero withDirection:(NSString *)aDirection withColor:(UIColor *)aColor{
	if ([self init]) {
		self.numero    = aNumero;
		self.direction = aDirection;
		self.couleur   = aColor;
	}
	return self;
}

- (void)dealloc {
	[numero release];
	[direction release];
	[couleur release];
    [super dealloc];
}

@end
