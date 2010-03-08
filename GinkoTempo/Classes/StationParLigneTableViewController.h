//
//  StationParLigneViewController.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 05/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GinkoDataSourceProtocol.h"
#import "ListeDesStationsPourUneLigne.h"

@interface StationParLigneTableViewController : UITableViewController {
    
    // Le tableau liste des Stations
	UITableView *theTableView;
    
    // Les dataSources à savoir liste des Stations
    ListeDesStationsPourUneLigne *dataSource;
    
}

@property (nonatomic,retain) UITableView *theTableView;
@property (nonatomic,retain) ListeDesStationsPourUneLigne *dataSource;

@end
