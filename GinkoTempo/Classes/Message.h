//
//  Message.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Message : NSObject {
    
    NSString *identifiant;
    
    NSString *titre;
    NSString *contenu;
    
    NSString *type; // 0 Message d'invalidation
                   // 1 Message d'informations 
    
}

@property (nonatomic, retain) NSString *identifiant;
@property (nonatomic, retain) NSString *titre;
@property (nonatomic, retain) NSString *contenu;
@property (nonatomic, retain) NSString *type;


@end
