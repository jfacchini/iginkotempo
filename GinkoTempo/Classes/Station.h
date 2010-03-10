//
//  Station.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//  C'est un objet de type Station de bus.
//
//

#import <Foundation/Foundation.h>


@interface Station : NSObject {
    NSNumber *ident;
	NSString *name;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *ident;

- (id)initWithName:(NSString *)aName;

- (id)initWithName:(NSString *)aName 
         withIdent:(NSNumber *)aNumber;

@end
