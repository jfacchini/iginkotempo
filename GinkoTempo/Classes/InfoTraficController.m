//
//  InfoTraficController.m
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 02/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InfoTraficController.h"
#import "InfoTrafic.h"
#import "WebserviceUtils.h"


@interface InfoTraficController(mymethods)
// these are private methods that outside classes need not use
- (void)setupInfosTraficArray;
- (NSNumber*) countNbITPrioritaires;
@end

@implementation InfoTraficController

@synthesize InfosTraficArray;
@synthesize nbInfosTraficPrioritaires;

static InfoTraficController *sharedInfoTraficControllerInstance = nil;

+ (InfoTraficController*) sharedInfoTraficController {
    @synchronized(self) {
        if (sharedInfoTraficControllerInstance == nil) {
            [[self alloc] init]; // assignment not done here
        }
    }
    return sharedInfoTraficControllerInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    
    @synchronized(self) {
        if (sharedInfoTraficControllerInstance == nil) {
            sharedInfoTraficControllerInstance = [super allocWithZone:zone];
            return sharedInfoTraficControllerInstance;  // assignment and return on first allocation
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
		[self setupInfosTraficArray];
        nbInfosTraficPrioritaires = [self countNbITPrioritaires];
	}
	return self;
}

- (NSNumber*) countNbITPrioritaires {
    int nbTot = [[sharedInfoTraficControllerInstance InfosTraficArray] count],
        nb = 0;
    InfoTrafic *it;
    
    for (int i = 0; i < nbTot; i++) {
        
        it = [[sharedInfoTraficControllerInstance InfosTraficArray] objectAtIndex:i];
        
        if (it.priorite) nb++;
    }
    return [NSNumber numberWithInt:nb];
}

- (void) setupInfosTraficArray {
    
    self.InfosTraficArray = [WebserviceUtils getInfoTrafic];
}

@end
