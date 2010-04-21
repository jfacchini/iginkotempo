//
//  TempsAttentesBornePersoTableViewController.h
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 02/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GinkoDataSourceProtocol.h"


@interface TempsAttentesBornePersoTableViewController : UITableViewController {

    UITableView *theTableView;
    //ListeTempsAttentesBornePerso
    id<GinkoDataSource,UITableViewDataSource> dataSource;
    NSDate *date;
    
    NSTimer *timer;
    NSTimer *timerChrono;
    
    UILabel *tempsAttente;
    UILabel *chrono;
    
    UIBarButtonItem *rafraichir;
    UIActivityIndicatorView *activityIndicator;

}

@property (nonatomic,retain) UITableView *theTableView;
@property (nonatomic,retain) id<GinkoDataSource,UITableViewDataSource> dataSource;

@property (nonatomic,retain) UIBarButtonItem *rafraichir;
@property (nonatomic,retain) NSTimer *timer;
@property (nonatomic,retain) NSTimer *timerChrono;

@property (nonatomic,retain) UILabel *tempsAttente;
@property (nonatomic,retain) UILabel *chrono;

@property (nonatomic,retain) NSDate *date;
@property (nonatomic,retain) UIActivityIndicatorView *activityIndicator;

- (id)initWithDataSource:(id<GinkoDataSource,UITableViewDataSource>)theDataSource;

@end
