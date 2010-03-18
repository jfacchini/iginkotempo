//
//  LignesTableViewController.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h> 
#import <CoreLocation/CLLocationManagerDelegate.h> 
#import "GinkoDataSourceProtocol.h"

@class Ligne;


@interface GeolocalisationTableViewController : UITableViewController <CLLocationManagerDelegate> {
	UITableView *theTableView;
    
    
    
    id<GinkoDataSource,UITableViewDataSource> dataSource;
    
    UIBarButtonItem *localiser;

    //Manager de Localisation
    CLLocationManager *locManager;
    BOOL enCoursDeGeolocalisation;
}

@property (nonatomic,retain) UITableView *theTableView;
@property (nonatomic,retain) UIBarButtonItem *localiser;
@property (nonatomic,retain) CLLocationManager *locManager;

@property (nonatomic,retain) id<GinkoDataSource,UITableViewDataSource> dataSource;

- (id)initWithDataSource:(id<GinkoDataSource,UITableViewDataSource>)theDataSource;
- (void)startLocalisation;

@end
