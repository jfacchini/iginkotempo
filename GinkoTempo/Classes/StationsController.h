//
//  StationsController.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StationsController : NSObject {

	NSMutableDictionary *stationsDictionary;
	NSMutableDictionary *nameIndexesDictionary;
	NSArray *stationNameIndexArray;
    
}

@property (nonatomic,retain) NSMutableDictionary *stationsDictionary;
@property (nonatomic,retain) NSMutableDictionary *nameIndexesDictionary;
@property (nonatomic,retain) NSArray *stationNameIndexArray;

+ (StationsController*)sharedStationsController;

- (NSArray *)stationsWithInitialLetter:(NSString*)aKey;


@end

