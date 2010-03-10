//
//  InfoTraficController.h
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 02/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface InfoTraficController : NSObject {
    
    NSArray *InfosTraficArray;
    NSNumber *nbInfosTraficPrioritaires;
    
}

@property (nonatomic,retain) NSArray *InfosTraficArray;
@property (nonatomic, retain) NSNumber *nbInfosTraficPrioritaires;

+ (InfoTraficController*)sharedInfoTraficController;

@end
