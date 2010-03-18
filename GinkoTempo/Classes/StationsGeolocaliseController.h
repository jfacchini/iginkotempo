//
//  StationsGeolocaliseController.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ligne.h"

@interface StationsGeolocaliseController : NSObject {
    
    float latitude;
    float longitude;
    
	NSMutableDictionary *stationsDictionary;
	//NSMutableDictionary *nameIndexesDictionary;
	NSArray *stationNameByOrder;
    
}

@property (nonatomic,retain) NSMutableDictionary *stationsDictionary;
@property (nonatomic,retain) NSArray *stationNameByOrder;

+ (StationsGeolocaliseController*)sharedStationsGeolocaliseController;
- (NSArray *)presortStationByOrder;
- (void)setLatitude:(float)lat withLong:(float)lon;


@end

