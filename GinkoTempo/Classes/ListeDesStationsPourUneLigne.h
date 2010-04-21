//
//  ListeDesStationsPourUneLigne.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GinkoDataSourceProtocol.h"
#import "Ligne.h"
#import "StationsParLigneController.h"

@interface ListeDesStationsPourUneLigne : NSObject <UITableViewDataSource> {
    Ligne *ligne;
    
}

@property (nonatomic,retain) Ligne *ligne;

- (UITableViewStyle)tableViewStyle;
-(id)initWithLigne:(Ligne *)aLigne;

@end
