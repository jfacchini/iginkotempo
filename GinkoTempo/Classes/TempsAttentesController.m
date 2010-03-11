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


static TempsAttentesController *sharedTempsAttentesControllerInstance = nil;

// Aucune idée de à quoi cela sert.
+ (TempsAttentesController*) sharedTempsAttentesController:(Station*) aStation {

    @synchronized(self) {
        if (sharedTempsAttentesControllerInstance == nil) {
            [[self alloc] initWithStation:aStation]; // assignment not done here
        }
    }
    
    return sharedTempsAttentesControllerInstance;
	// note: Xcode (3.2) static analyzer will report this singleton as a false positive
	// '(Potential leak of an object allocated')
}


+ (id)allocWithZone:(NSZone *)zone {
    
    @synchronized(self) {
        if (sharedTempsAttentesControllerInstance == nil) {
            sharedTempsAttentesControllerInstance = [super allocWithZone:zone];
            return sharedTempsAttentesControllerInstance;  // assignment and return on first allocation
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
- init {
	if (self = [super init]) {
		[self setupTempsAttentesArray];
	}
	return self;
}

// setup the data collection
- initWithStation:(Station *)aStation {
	if (self = [super init]) {
        
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
    
    
	// iterate over the values in the raw elements dictionary
	for (tempsAttentes in rawLignesArray)
	{
        
		// store that item in the elements dictionary with the name as the key
        [tempsAttentesDictionary setObject:tempsAttentes forKey:tempsAttentes.ligne.ident];
        
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
