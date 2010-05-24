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
    
    UILabel *tempsAttente;
    
    UIBarButtonItem *rafraichir;
    UIActivityIndicatorView *activityIndicator;

    Boolean *borneIsActive;
}

@property (nonatomic,retain) UITableView *theTableView;
@property (nonatomic,retain) id<GinkoDataSource,UITableViewDataSource> dataSource;

@property (nonatomic,retain) UIBarButtonItem *rafraichir;
@property (nonatomic,retain) NSTimer *timer;

@property (nonatomic,retain) UILabel *tempsAttente;

@property (nonatomic,retain) NSDate *date;
@property (nonatomic,retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic) Boolean *borneIsActive;

- (id)initWithDataSource:(id<GinkoDataSource,UITableViewDataSource>)theDataSource;

@end
