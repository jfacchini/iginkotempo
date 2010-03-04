//
//  InfoTrafic.h
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 02/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface InfoTrafic : NSObject {
    NSString *titre;
    NSString *identifiant;
    NSString *corps;
    NSURL *lienSurGinkobus;
    BOOL priorite;
}

- (id) initWithTitle:(NSString *) aTitle
              withId:(NSString *) aId
            withBody:(NSString *) aBody
            withLink:(NSURL *) aLink
        withPriority:(BOOL) aPriority;

@property (nonatomic, retain) NSString *titre;
@property (nonatomic, retain) NSString *identifiant;
@property (nonatomic, retain) NSString *corps;
@property (nonatomic, retain) NSURL *lienSurGinkobus;
@property BOOL priorite;

@end
