//
//  StationsController.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LignesController : NSObject {
    
	NSMutableDictionary *lignesDictionary;
    NSArray *ligneSortedByNumber;
    
}

@property (nonatomic,retain) NSMutableDictionary *lignesDictionary;
@property (nonatomic,retain) NSArray *ligneSortedByNumber;

+ (LignesController*)sharedLignesController;


@end
