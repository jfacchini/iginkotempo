//
//  TempsAttentesBornePersoController.h
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 01/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TempsAttentesBornePersoController : NSObject {
    NSArray *tempsAttentesBornePerso;
//    NSMutableDictionary *stationsEtNombreLignes;
}

@property (nonatomic,retain) NSArray *tempsAttentesBornePerso;
//@property (nonatomic,retain) NSMutableDictionary *stationsEtNombreLignes;

+(NSString *)md5HashString:(NSString *)stringToHash;
+(TempsAttentesBornePersoController *) sharedTempsAttentesBornePersoController;
-(void)setupTempsAttentesBornePersoArray;

@end
