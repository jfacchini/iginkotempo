//
//  Message.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Message.h"


@implementation Message

@synthesize identifiant;
@synthesize titre;
@synthesize contenu;
@synthesize type;

- (void)dealloc {
	[identifiant release];
	[titre release];
	[contenu release];
	[type release];
    [super dealloc];
}

@end
