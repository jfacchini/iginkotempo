//
//  Ligne.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Ligne : NSObject {
    NSString *numero;
    NSString *direction;
    NSString *sens;
    UIColor *couleurTexte;
    UIColor *couleurFond;
}

@property (nonatomic, retain) NSString *numero;
@property (nonatomic, retain) NSString *direction;
@property (nonatomic, retain) NSString *sens;
@property (nonatomic, retain) UIColor *couleurTexte;
@property (nonatomic, retain) UIColor *couleurFond;

- (id)initWithNumero:(NSString *)aNumero 
            withSens:(NSString *)aSens 
       withDirection:(NSString *)aDirection 
      withColorLabel:(UIColor *)aColorLabel 
 withColorBackground:(UIColor *)aColorBackground;

@end
