//
//  StationsController.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StationsParLigneController.h"
#import "Station.h"
#import "Ligne.h"
#import "WebserviceUtils.h"

@interface StationsParLigneController(mymethods)
// these are private methods that outside classes need not use
- (void)presortStationInitialLetterIndexes;
- (void)presortStationNamesForInitialLetter:(NSString *)aKey;
- (void)setupStationsArray;
@end


@implementation StationsParLigneController

@synthesize ligne;
@synthesize stationsDictionary;
@synthesize nameIndexesDictionary;
@synthesize stationNameIndexArray;

static StationsParLigneController *sharedStationsControllerInstance = nil;

// Aucune idée de à quoi cela sert.


+ (StationsParLigneController*) sharedStationsController:(Ligne*)aLigne {
    @synchronized(self) {
        if (sharedStationsControllerInstance == nil) {
            [[self alloc] initWithLigne:aLigne]; // assignment not done here
        }
        
    }
    return sharedStationsControllerInstance;
	// note: Xcode (3.2) static analyzer will report this singleton as a false positive
	// '(Potential leak of an object allocated')
}


+ (id)allocWithZone:(NSZone *)zone {
    
    @synchronized(self) {
        if (sharedStationsControllerInstance == nil) {
            sharedStationsControllerInstance = [super allocWithZone:zone];
            return sharedStationsControllerInstance;  // assignment and return on first allocation
        }
    }
    
    return nil; //on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;  //denotes an object that cannot be released
}

- (void)release {
    //do nothing
}

- (id)autorelease {
    return self;
}


// setup the data collection
- initWithLigne:(Ligne*)aLigne {
	if (self = [super init]) {
        
	}
	return self;
}

// setup the data collection
- (void)setLigne:(Ligne*)aLigne {
    ligne = aLigne;
    [self setupStationsArray];
}


- (void)setupStationsArray {
	NSString *eachStation;
	
	// create dictionaries that contain the arrays of element data indexed by
	// name
	self.stationsDictionary = [NSMutableDictionary dictionary];
    
	// unique first characters (for the Name index table)
	self.nameIndexesDictionary = [NSMutableDictionary dictionary];
    
	// read the element data from the plist
	NSArray *rawStationsArray = [WebserviceUtils getListeStationsParLigne:ligne.numero
                                                                         :ligne.sens];
    
    //[rawStationsArray addObject:nil];
    
	// iterate over the values in the raw elements dictionary
	for (eachStation in rawStationsArray)
	{
        //printf("> %s\n", [eachStation cString]);
		
        // create an atomic element instance for each
		Station *aStation = [[Station alloc] initWithName:eachStation];
		
		// store that item in the elements dictionary with the name as the key
		[stationsDictionary setObject:aStation forKey:aStation.name];
		
		// get the element's initial letter
		NSString *firstLetter = [aStation.name substringToIndex:1];
		NSMutableArray *existingArray;
		
		// if an array already exists in the name index dictionary
		// simply add the element to it, otherwise create an array
		// and add it to the name index dictionary with the letter as the key
		if (existingArray = [nameIndexesDictionary valueForKey:firstLetter]) 
		{
            
            [existingArray addObject:aStation];
            
		} else {
            
			NSMutableArray *tempArray = [NSMutableArray array];
			[nameIndexesDictionary setObject:tempArray forKey:firstLetter];
			[tempArray addObject:aStation];
            
		}
        
        
		
		// release the element, it is held by the various collections
		[aStation release];
	}
	// release the raw element data
	
	
	// presort the dictionaries now
	// this could be done the first time they are requested instead
	
	[self presortStationInitialLetterIndexes];
    
	
}

// return an array of elements for an initial letter (ie A, B, C, ...)
- (NSArray *)stationsWithInitialLetter:(NSString*)aKey {
    
	return [nameIndexesDictionary objectForKey:aKey];
}


// presort the name index arrays so the elements are in the correct order
- (void)presortStationInitialLetterIndexes {
	self.stationNameIndexArray = [[nameIndexesDictionary allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
	for (NSString *eachNameIndex in stationNameIndexArray) {
		[self presortStationNamesForInitialLetter:eachNameIndex];
	}
}


- (void)presortStationNamesForInitialLetter:(NSString *)aKey {
	NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
																   ascending:YES
																	selector:@selector(localizedCaseInsensitiveCompare:)] ;
	
	NSArray *descriptors = [NSArray arrayWithObject:nameDescriptor];
	[[nameIndexesDictionary objectForKey:aKey] sortUsingDescriptors:descriptors];
	[nameDescriptor release];
}




@end
