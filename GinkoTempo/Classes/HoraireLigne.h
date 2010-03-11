//
//  HoraireLigne.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HoraireLigne : NSObject {
    Station station;
    Ligne ligne;
    NSString horaire1;
    NSString horaire2;
    NSString infoComplementaire1;
    NSString infoComplementaire2;
    NSArray message;
}

@property (nonatomic, retain) Station *station;
@property (nonatomic, retain) Ligne *ligne;
@property (nonatomic, retain) NSString *horaire1;
@property (nonatomic, retain) NSString *horaire2;
@property (nonatomic, retain) NSString *infoComplementaire1;
@property (nonatomic, retain) NSString *infoComplementaire2;
@property (nonatomic, retain) NSArray *message;


@end
