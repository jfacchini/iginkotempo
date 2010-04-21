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
    
    Station *station;
    
    NSTimer *timer;
    NSTimer *timerChrono;

    // Les dataSources à savoir liste des Stations
    TempsAttentesLignesParStation *dataSource;
    
    UILabel *tempsAttente;
    UILabel *chrono;
    int *cmptRafraichissement;
    
    UIBarButtonItem *rafraichir;
    UIActivityIndicatorView *activityIndicator;
    
    NSDate *date;
}

@property (nonatomic,retain) UITableView *theTableView;
@property (nonatomic,retain) UIBarButtonItem *rafraichir;
@property (nonatomic,retain) NSTimer *timer;
@property (nonatomic,retain) NSTimer *timerChrono;
@property (nonatomic) int *cmptRafraichissement;

@property (nonatomic,retain) Station *station;

@property (nonatomic,retain) UILabel *tempsAttente;
@property (nonatomic,retain) UILabel *chrono;

@property (nonatomic,retain) NSDate *date;
@property (nonatomic,retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic,retain) TempsAttentesLignesParStation *dataSource;

@end
