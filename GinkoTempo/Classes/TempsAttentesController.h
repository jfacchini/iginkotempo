//
//  StationsController.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"

@interface TempsAttentesController : NSObject {
    Station *station;
	NSMutableDictionary *tempsAttentesDictionary;
    NSArray *tempsAttentesSortedByNumber;
    
}

@property (nonatomic,retain) Station *station;
@property (nonatomic,retain) NSMutableDictionary *tempsAttentesDictionary;
@property (nonatomic,retain) NSArray *tempsAttentesSortedByNumber;

+ (TempsAttentesController *)sharedTempsAttentesController:(Station*) aStation;


@end
