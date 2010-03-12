//
//  HoraireLigne.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"
#import "Ligne.h"

@interface TempsAttentes : NSObject {
    Station *station;
    Ligne *ligne;
    NSString *direction1;
    NSString *direction2;
    NSString *horaire1;
    NSString *horaire2;
    NSString *infoComplementaire1;
    NSString *infoComplementaire2;
    NSArray *message;
}

@property (nonatomic, retain) Station *station;
@property (nonatomic, retain) Ligne *ligne;
@property (nonatomic, retain) NSString *direction1;
@property (nonatomic, retain) NSString *direction2;
@property (nonatomic, retain) NSString *horaire1;
@property (nonatomic, retain) NSString *horaire2;
@property (nonatomic, retain) NSString *infoComplementaire1;
@property (nonatomic, retain) NSString *infoComplementaire2;
@property (nonatomic, retain) NSArray *message;

// Initialisation pour la borne perso, avec des stations différentes.
- (id)initWithStation:(Station *)station
            withLigne:(Ligne *)ligne  
       withDirection1:(NSString *)direction1
       withDirection2:(NSString *)direction2 
         withHoraire1:(NSString *)horaire1
         withHoraire2:(NSString *)horaire2  
            withInfo1:(NSString *)infoComplementaire1 
            withInfo2:(NSString *)infoComplementaire2 
         withMessages:(NSArray *)message;

// Cette initialisation est pour les temps d'attentes pour une même station.
- (id)initwithLigne:(Ligne *)ligne  
     withDirection1:(NSString *)direction1
     withDirection2:(NSString *)direction2 
       withHoraire1:(NSString *)horaire1
       withHoraire2:(NSString *)horaire2  
          withInfo1:(NSString *)infoComplementaire1 
          withInfo2:(NSString *)infoComplementaire2 
       withMessages:(NSArray *)message;

@end
