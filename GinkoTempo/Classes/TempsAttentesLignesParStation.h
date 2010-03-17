//
//  ListeDesStationsPourUneLigne.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GinkoDataSourceProtocol.h"
#import "Station.h"
#import "StationsParLigneController.h"
#import "TempsAttentesController.h"

@interface TempsAttentesLignesParStation : NSObject {
    Station *station;
    TempsAttentesController *tempsAttentesController;
}

@property (nonatomic,retain) Station *station;
@property (nonatomic,retain) TempsAttentesController *tempsAttentesController;


- (UITableViewStyle)tableViewStyle;
-(id)initWithStation:(Station *)aStation;

@end
