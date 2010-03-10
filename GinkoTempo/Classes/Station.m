//
//  Station.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//  C'est un objet de type Station de bus.
//
//

#import "Station.h"


@implementation Station

@synthesize name;
@synthesize ident;


- (id)initWithName:(NSString *)aName {
	if ([self init]) {
		self.name = aName;
        self.ident = 0;
	}
	return self;
}

- (id)initWithName:(NSString *)aName 
         withIdent:(NSNumber *)aNumber {
	if ([self init]) {
		self.name = aName;
        self.ident = aNumber;
	}
	return self;
}

- (void)dealloc {
	[name release];
    [super dealloc];
}



@end
