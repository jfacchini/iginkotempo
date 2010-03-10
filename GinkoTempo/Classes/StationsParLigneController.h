//
//  StationsParLigneController.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ligne.h"

@interface StationsParLigneController : NSObject {
    Ligne *ligne;
	NSMutableDictionary *stationsDictionary;
	NSMutableDictionary *nameIndexesDictionary;
	NSArray *stationNameIndexArray;
    
}

@property (nonatomic,retain) Ligne *ligne;
@property (nonatomic,retain) NSMutableDictionary *stationsDictionary;
@property (nonatomic,retain) NSMutableDictionary *nameIndexesDictionary;
@property (nonatomic,retain) NSArray *stationNameIndexArray;

+ (StationsParLigneController*)sharedStationsParLigneController:(Ligne*)aLigne;

- (NSArray *)stationsWithInitialLetter:(NSString*)aKey;


@end

