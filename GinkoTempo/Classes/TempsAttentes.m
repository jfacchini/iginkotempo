//
//  HoraireLigne.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TempsAttentes.h"

@implementation TempsAttentes

@synthesize station;
@synthesize ligne;
@synthesize horaire1;
@synthesize horaire2;
@synthesize infoComplementaire1;
@synthesize infoComplementaire2;
@synthesize message;


// Initialisation pour la borne perso, avec des stations différentes.
- (id)initWithStation:(Station *)s
            withLigne:(Ligne *)l 
         withHoraire1:(NSString *)h1
         withHoraire2:(NSString *)h2  
            withInfo1:(NSString *)i1 
            withInfo2:(NSString *)i2 
         withMessages:(NSArray *)m
{
    if ([self init]) {
        self.station                = s;
		self.ligne                  = l;
		self.horaire1               = h1;
		self.horaire2               = h2;
		self.infoComplementaire1    = i1;
		self.infoComplementaire2    = i2;
		self.message                = m;
	}
	return self;
    
}

// Cette initialisation est pour les temps d'attentes pour une même station.
- (id)initwithLigne:(Ligne *)l 
       withHoraire1:(NSString *)h1
       withHoraire2:(NSString *)h2  
          withInfo1:(NSString *)i1 
          withInfo2:(NSString *)i2 
       withMessages:(NSArray *)m
{    
    return [self initWithStation:NULL 
                       withLigne:l
                    withHoraire1:h1 
                    withHoraire2:h2 
                       withInfo1:i1 
                       withInfo2:i1 
                    withMessages:m];
}


- (void)dealloc {
	[station release];
	[ligne release];
	[horaire1 release];
	[horaire2 release];
	[infoComplementaire1 release];
	[infoComplementaire2 release];
	[message release];
    [super dealloc];
}


@end
