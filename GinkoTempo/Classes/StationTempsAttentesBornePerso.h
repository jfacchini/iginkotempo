//
//  StationTempsAttentes.h
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 21/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"


@interface StationTempsAttentesBornePerso : NSObject {

    Station *station;
    NSArray *tempsAttentes;
}

-(id)initWithStation:(Station *) aStation
   withTempsAttentes:(NSArray *) aTempsAttentes;

@property (nonatomic, retain) Station *station;
@property (nonatomic, retain) NSArray *tempsAttentes;

@end
