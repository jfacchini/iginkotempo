//
//  LignesController.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LignesController.h"
#import "Ligne.h"

@interface LignesController(mymethods)
// these are private methods that outside classes need not use
- (void)presortLignesNamesForInitialLetter:(NSString *)aKey;
- (void)setupLignesArray;
@end


@implementation LignesController

@synthesize lignesDictionary;

static LignesController *sharedLignesControllerInstance = nil;

// Aucune idée de à quoi cela sert.
+ (LignesController*) sharedLignesController {
    @synchronized(self) {
        if (sharedLignesControllerInstance == nil) {
            [[self alloc] init]; // assignment not done here
        }
    }
    return sharedLignesControllerInstance;
	// note: Xcode (3.2) static analyzer will report this singleton as a false positive
	// '(Potential leak of an object allocated')
}


+ (id)allocWithZone:(NSZone *)zone {
    
    @synchronized(self) {
        if (sharedLignesControllerInstance == nil) {
            sharedLignesControllerInstance = [super allocWithZone:zone];
            return sharedLignesControllerInstance;  // assignment and return on first allocation
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
		[self setupLignesArray];
	}
	return self;
}

- (void)setupLignesArray {
	Ligne *eachLigne;
	
	// create dictionaries that contain the arrays of element data indexed by
	// name
	self.lignesDictionary = [NSMutableDictionary dictionary];
    
	// unique first characters (for the Name index table)
	//self.nameIndexesDictionary = [NSMutableDictionary dictionary];
    
    /*
     
     #define UIColorFromRGB(rgbValue) [UIColor \  
     colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \  
     green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \  
     blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]  
     
     */
    
	// read the element data from the plist
	NSArray *rawLignesArray = [NSArray arrayWithObjects:
                               [[[Ligne alloc] initWithNumero:[[NSNumber alloc] initWithInt:1]
                                                withDirection:@"Ligne 1" 
                                                    withColor:[[UIColor alloc] initWithRed:0.5 green:0.5 blue:0.5 alpha:1]] autorelease],
                               
                               [[[Ligne alloc] initWithNumero:[[NSNumber alloc] initWithInt:1]
                                                withDirection:@"Ligne 2" 
                                                    withColor:[[UIColor alloc] initWithRed:0.0 green:0.5 blue:0.5 alpha:1]] autorelease],
                               
                               [[[Ligne alloc] initWithNumero:[[NSNumber alloc] initWithInt:1]
                                                withDirection:@"Ligne 8" 
                                                    withColor:[[UIColor alloc] initWithRed:0.5 green:0.5 blue:0.0 alpha:1]] autorelease],
                               
                               nil];
    
	// iterate over the values in the raw elements dictionary
	for (eachLigne in rawLignesArray)
	{
        //printf("> %s\n", [eachStation cString]);
		
        // create an atomic element instance for each
		Ligne *aLigne = eachLigne;
		
		// store that item in the elements dictionary with the name as the key
		[lignesDictionary setObject:aLigne forKey:aLigne.numero];
        
		// release the element, it is held by the various collections
		[aLigne release];
	}
	// release the raw element data
    
	//self.ligneNameIndexArray = [[nameIndexesDictionary allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
	
	// presort the dictionaries now
	// this could be done the first time they are requested instead
    
	
}




@end
