//
//  HoraireLigne.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TempsAttentes.h"

@implementation TempsAttentes

@synthesize ident;
@synthesize station;
@synthesize ligne;
@synthesize direction1;
@synthesize direction2;
@synthesize horaire1;
@synthesize horaire2;
@synthesize infoComplementaire1;
@synthesize infoComplementaire2;
@synthesize message;


// Initialisation pour la borne perso, avec des stations différentes.
- (id)initWithIdent:(NSNumber*)i
        withStation:(Station *)s
          withLigne:(Ligne *)l 
     withDirection1:(NSString *)d1
     withDirection2:(NSString *)d2 
       withHoraire1:(NSString *)h1
       withHoraire2:(NSString *)h2  
          withInfo1:(NSString *)i1 
          withInfo2:(NSString *)i2 
       withMessages:(NSArray *)m
{
    if ([self init]) {
        self.ident                  = i;
        self.station                = s;
		self.ligne                  = l;
		self.direction1             = d1;
		self.direction2             = d2;
		self.horaire1               = h1;
		self.horaire2               = h2;
		self.infoComplementaire1    = i1;
		self.infoComplementaire2    = i2;
		self.message                = m;
	}
	return self;
    
}

// Cette initialisation est pour les temps d'attentes pour une même station.
- (id)initWithIdent:(NSNumber*)i
          withLigne:(Ligne *)l 
     withDirection1:(NSString *)d1
     withDirection2:(NSString *)d2
       withHoraire1:(NSString *)h1
       withHoraire2:(NSString *)h2  
          withInfo1:(NSString *)i1 
          withInfo2:(NSString *)i2 
       withMessages:(NSArray *)m
{    
    return [self initWithIdent:i
                   withStation:NULL 
                     withLigne:l
                withDirection1:d1
                withDirection2:d2
                  withHoraire1:h1 
                  withHoraire2:h2 
                     withInfo1:i1 
                     withInfo2:i1 
                  withMessages:m];
}


- (void)dealloc {
	[ident release];
	[station release];
	[ligne release];
	[direction1 release];
	[direction2 release];
	[horaire1 release];
	[horaire2 release];
	[infoComplementaire1 release];
	[infoComplementaire2 release];
	[message release];
    [super dealloc];
}


@end
