//
//  Ligne.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Ligne : NSObject {
    NSNumber *numero;
    NSString *direction;
    UIColor *couleur;
}

@property (nonatomic, retain) NSNumber *numero;
@property (nonatomic, retain) NSString *direction;
@property (nonatomic, retain) UIColor *couleur;


@end
