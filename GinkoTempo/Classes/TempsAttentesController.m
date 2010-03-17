//
//  LignesController.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TempsAttentesController.h"
#import "Station.h"
#import "WebserviceUtils.h"
#import "TempsAttentes.h"

@interface TempsAttentesController(mymethods)
// these are private methods that outside classes need not use
- (NSArray *)presortTempsAttentesByNumber;
- (void)setupTempsAttentesArray;
@end


@implementation TempsAttentesController

@synthesize station;
@synthesize tempsAttentesDictionary;
@synthesize tempsAttentesSortedByNumber;


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
- init {
	if (self = [super init]) {
		[self setupTempsAttentesArray];
	}
	return self;
}

// setup the data collection
- initWithStation:(Station *)aStation {
	if (self = [super init]) {
        station = aStation;
        [self setupTempsAttentesArray];
	}
	return self;
}

// setup the data collection
- (void)setStation:(Station *)aStation {
    station = aStation;
    [self setupTempsAttentesArray];
}


- (void)setupTempsAttentesArray {
    
	TempsAttentes *tempsAttentes;
	
	// create dictionaries that contain the arrays of element data indexed by
	// name
	self.tempsAttentesDictionary = [NSMutableDictionary dictionary];
    
    
       
	// read the element data from the plist
    NSArray *rawLignesArray = [WebserviceUtils getTempsParStation:station.name];
    
    //printf("%i\n", [rawLignesArray count]);
	// iterate over the values in the raw elements dictionary
	for (tempsAttentes in rawLignesArray)
	{
        
		// store that item in the elements dictionary with the name as the key
        [tempsAttentesDictionary setObject:tempsAttentes forKey:tempsAttentes.ident];
        
	}
        
    //On fait le tri des lignes par Numéro pour l'affichage
    self.tempsAttentesSortedByNumber = [self presortTempsAttentesByNumber];
    
}

// presort the elementsSortedByNumber array
- (NSArray *)presortTempsAttentesByNumber {
	NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"ident"
																   ascending:YES
																	selector:@selector(compare:)] ;
	
	NSArray *descriptors = [NSArray arrayWithObject:nameDescriptor];
	NSArray *sortedElements = [[tempsAttentesDictionary allValues] sortedArrayUsingDescriptors:descriptors];
	[nameDescriptor release];
	return sortedElements;
}




@end
