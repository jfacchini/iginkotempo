//
//  InfoTrafic.m
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 02/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InfoTrafic.h"


@implementation InfoTrafic

@synthesize titre;
@synthesize identifiant;
@synthesize corps;
@synthesize lienSurGinkobus;
@synthesize priorite;

- (id) initWithTitle:(NSString *) aTitle
              withId:(NSString *) anId
         withBody:(NSString *) aBody
            withLink:(NSURL *) aLink
        withPriority:(BOOL) aPriority
{
    if ([self init]) {
        
        self.titre = aTitle;
        self.identifiant = anId;
        self.corps = aBody;
        self.lienSurGinkobus = aLink;
        self.priorite = aPriority;
        
    }
    return self;
}

- (void) dealloc {
    [titre release];
    [identifiant release];
    [corps release];
    [lienSurGinkobus release];
    [super dealloc];
}

@end
