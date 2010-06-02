//
//  TempsAttentesBornePersoController.m
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 01/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>

#import "TempsAttentesBornePersoController.h"
#import "TempsAttentes.h"
#import "WebserviceUtils.h"

@implementation TempsAttentesBornePersoController

@synthesize tempsAttentesBornePerso;
//@synthesize stationsEtNombreLignes;

+(NSString *)md5HashString:(NSString *)stringToHash {
    
    if (stringToHash == nil) {
        return nil;
    }
    
    const char *cStr = [stringToHash UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), result);
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], 
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]]; 
}

static TempsAttentesBornePersoController *sharedTempsAttentesBornePersoControllerInstance = nil;

+ (TempsAttentesBornePersoController*) sharedTempsAttentesBornePersoController {
    @synchronized(self) {
        if (sharedTempsAttentesBornePersoControllerInstance == nil) {
            [[self alloc] init]; // assignment not done here
        }
    }
    return sharedTempsAttentesBornePersoControllerInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    
    @synchronized(self) {
        if (sharedTempsAttentesBornePersoControllerInstance == nil) {
            sharedTempsAttentesBornePersoControllerInstance = [super allocWithZone:zone];
            return sharedTempsAttentesBornePersoControllerInstance;  // assignment and return on first allocation
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
		[self setupTempsAttentesBornePersoArray];
	}
	return self;
}

- (void)setupTempsAttentesBornePersoArray {
    
    // Récupération des identifiants - ici on considère que les identifiants sont correctes
    NSString *login = (NSString *) [[NSUserDefaults standardUserDefaults] objectForKey:@"loginKey"];
    NSString *mdp = (NSString *) [[NSUserDefaults standardUserDefaults] objectForKey:@"mdpKey"];
    
	// read the element data from the plist
    self.tempsAttentesBornePerso = [WebserviceUtils getLigneStationBornePerso:login:[TempsAttentesBornePersoController md5HashString:mdp]];
    
}

@end
