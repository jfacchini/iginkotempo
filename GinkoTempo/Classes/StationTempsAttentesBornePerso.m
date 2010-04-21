//
//  StationTempsAttentes.m
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 21/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StationTempsAttentesBornePerso.h"


@implementation StationTempsAttentesBornePerso

@synthesize station;
@synthesize tempsAttentes;

- (id) initWithStation:(Station *) aStation
   withTempsAttentes:(NSArray *) aTempsAttentes
{
    if ([self init]) {
        
        self.station = aStation;
        self.tempsAttentes = aTempsAttentes;
        
    }
    return self;
}

- (void) dealloc {
    [station release];
    [tempsAttentes release];
    [super dealloc];
}

@end
