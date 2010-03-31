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
	//NSMutableDictionary *nameIndexesDictionary;
	NSArray *stationNameByOrder;
    
}

@property (nonatomic,retain) Ligne *ligne;
@property (nonatomic,retain) NSMutableDictionary *stationsDictionary;
@property (nonatomic,retain) NSArray *stationNameByOrder;

+ (StationsParLigneController*)sharedStationsParLigneController:(Ligne*)aLigne;

- (NSArray *)presortStationByOrder;
- initWithLigne:(Ligne*)aLigne;


@end

