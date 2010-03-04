//
//  LignesController.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LignesController.h"
#import "Ligne.h"
#import "WebserviceUtils.h"


@interface LignesController(mymethods)
// these are private methods that outside classes need not use
- (NSArray *)presortLigneByNumber;
- (void)setupLignesArray;
@end


@implementation LignesController

@synthesize lignesDictionary;
@synthesize ligneSortedByNumber;


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
	Ligne *aLigne;
	
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
    NSArray *rawLignesArray = [WebserviceUtils getListeLignes];


    printf("%i\n",[rawLignesArray count]);
    
	// iterate over the values in the raw elements dictionary
	for (aLigne in rawLignesArray)
	{
    
		// store that item in the elements dictionary with the name as the key
		[lignesDictionary setObject:aLigne forKey:aLigne.numero];
        
	}
    
	//self.ligneNameIndexArray = [[nameIndexesDictionary allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

    //On fait le tri des lignes par Numéro pour l'affichage
    self.ligneSortedByNumber = [self presortLigneByNumber];

	
}

// presort the elementsSortedByNumber array
- (NSArray *)presortLigneByNumber {
	NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"numero"
																   ascending:YES
																	selector:@selector(compare:)] ;
	
	NSArray *descriptors = [NSArray arrayWithObject:nameDescriptor];
	NSArray *sortedElements = [[lignesDictionary allValues] sortedArrayUsingDescriptors:descriptors];
	[nameDescriptor release];
	return sortedElements;
}




@end
