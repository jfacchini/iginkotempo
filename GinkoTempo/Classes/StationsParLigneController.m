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
- (void)setupStationsArray;
- (void)presortStationByOrder;
@end


@implementation StationsParLigneController

@synthesize ligne;
@synthesize stationsDictionary;
@synthesize stationNameByOrder;

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
    

	// read the element data from the plist
	NSArray *rawStationsArray = [WebserviceUtils getListeStationsParLigne:ligne.numero
                                                                         :ligne.sens];
    
    //[rawStationsArray addObject:nil];
    int i = 0;
    
	// iterate over the values in the raw elements dictionary
	for (eachStation in rawStationsArray)
	{
        // create an atomic element instance for each
		Station *aStation = [[Station alloc] initWithName:eachStation withIdent:[NSNumber numberWithInt:i]];
		
		// store that item in the elements dictionary with the name as the key
		[stationsDictionary setObject:aStation forKey:aStation.name];

        // release the element, it is held by the various collections
        
        i=i+1;
        [aStation release];
	}
	// release the raw element data
	

	self.stationNameByOrder = [self presortStationByOrder];
    
	
}


// presort the name index arrays so the elements are in the correct order
- (NSArray *)presortStationByOrder {
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"ident"
																   ascending:YES
																	selector:@selector(compare:)] ;
	
	NSArray *descriptors = [NSArray arrayWithObject:nameDescriptor];
	NSArray *sortedElements = [[stationsDictionary allValues] sortedArrayUsingDescriptors:descriptors];
	[nameDescriptor release];
	return sortedElements;
	
    
}




@end
