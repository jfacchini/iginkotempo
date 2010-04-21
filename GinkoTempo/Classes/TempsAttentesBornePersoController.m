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


@interface TempsAttentesBornePersoController(mymethods)

@end

@implementation TempsAttentesBornePersoController

@synthesize tempsAttentesBornePerso;
@synthesize stationsEtNombreLignes;

+(NSString *)md5HashString:(NSString *)stringToHash {
    const char *cStr = [stringToHash UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), result);
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], 
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]]; 
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
    
    TempsAttentes *tempsAttentes;
    Station *station, *stationPrec = nil;
    int cptLigne = 0;
    
    // Récupération des identifiants - ici on considère que les identifiants sont correctes
    NSString *login = (NSString *) [[NSUserDefaults standardUserDefaults] objectForKey:@"loginKey"];
    NSString *mdp = (NSString *) [[NSUserDefaults standardUserDefaults] objectForKey:@"mdpKey"];
    
	// read the element data from the plist
    tempsAttentesBornePerso = [WebserviceUtils getLigneStationBornePerso:login:[TempsAttentesBornePersoController md5HashString:mdp]];
    
	for (tempsAttentes in tempsAttentesBornePerso) {
        
        station = tempsAttentes.station;
        
        if (stationPrec == nil) {
            stationPrec = station;
        }
        
        if (station.name != stationPrec.name) {
            [stationsEtNombreLignes setValue:[NSNumber numberWithInt:cptLigne] forKey:stationPrec.name];
            cptLigne = 1;
        }
        else {
            cptLigne++;
        }

        
	}
    
    [stationsEtNombreLignes setValue:[NSNumber numberWithInt:cptLigne] forKey:stationPrec.name];
    
}

@end
