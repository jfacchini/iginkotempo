//
//  StationParLigneViewController.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 05/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GinkoDataSourceProtocol.h"
#import "TempsAttentesLignesParStation.h"

@interface TempsAttentesLignesParStationViewController : UITableViewController {
    
    // Le tableau liste des Stations
	UITableView *theTableView;
    
    NSTimer *timer;
    
    // Les dataSources à savoir liste des Stations
    TempsAttentesLignesParStation *dataSource;
    
    UILabel *tempsAttente;

    
    UIActivityIndicatorView *activityIndicator;
    
    NSDate *date;
}

@property (nonatomic,retain) UITableView *theTableView;
@property (nonatomic,retain) NSTimer *timer;
@property (nonatomic,retain) NSTimer *timerAvantRafraichissement;
@property (nonatomic,retain) UILabel *tempsAttente;
@property (nonatomic,retain) NSDate *date;
@property (nonatomic,retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic,retain) TempsAttentesLignesParStation *dataSource;

@end
