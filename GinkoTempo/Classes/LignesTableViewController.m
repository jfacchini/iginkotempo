//
//  LignesTableViewController.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StationsTableViewController.h"
#import "LignesTableViewController.h"
#import "ListeDesLignes.h"
#import "GinkoTempoAppDelegate.h"
#import "Ligne.h"
#import "StationParLigneTableViewController.h"

//Si on click sur une ligne, go liste des Stations de la ligne
#import "ListeDesStationsPourUneLigne.h"


@implementation LignesTableViewController

// Donne accès aux variables
@synthesize theTableView;
@synthesize dataSource;


- (id)initWithDataSource:(id<GinkoDataSource,UITableViewDataSource>)theDataSource {
    
    if ([self init]) {
        
        theTableView = nil;
        
        // retain the data source
        self.dataSource = theDataSource;
        // set the title, and tab bar images from the dataSource
        // object. These are part of the ElementsDataSource Protocol
        self.title = [dataSource name];
        self.tabBarItem.image = [dataSource tabBarImage];
        
        // set the long name shown in the navigation bar
        self.navigationItem.title=[dataSource navigationBarName];
        
        // create a custom navigation bar button and set it to always say "back"
        UIBarButtonItem *temporaryBarButtonItem=[[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title=@"Retour";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [temporaryBarButtonItem release];
        
    }
    
    return self;
}

- (void)dealloc {
    theTableView.delegate = nil;
    theTableView.dataSource = nil;
    [theTableView release];
    [dataSource release];
    [super dealloc];
}

- (void)loadView {
    
    // create a new table using the full application frame
    // we'll ask the datasource which type of table to use (plain or grouped)
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] 
                                                          style:[dataSource tableViewStyle]];
    
    // set the autoresizing mask so that the table will always fill the view
    tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    
    // set the cell separator to a single straight line.
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // set the tableview delegate to this object and the datasource to the datasource which has already been set
    tableView.delegate = self;
    tableView.dataSource = dataSource;
    
    //tableView.sectionIndexMinimumDisplayRowCount=10;
    
    // set the tableview as the controller view
    self.theTableView = tableView;
    self.view = tableView;
    [tableView release];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [dataSource ];
//}

// the user selected a row in the table.
// the user selected a row in the table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {
    
    
	// deselect the new row using animation
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
	
    
	// get the element that is represented by the selected row.
    Ligne *aLigne = [dataSource objectForIndexPath:newIndexPath];

    
    // create an AtomicElementViewController. This controller will display the full size tile for the element
	//StationsTableViewController *stationController = [[StationsTableViewController alloc] initWithDataSource:[ListeDesStations class]];

    
    id dSource = [[ListeDesStationsPourUneLigne alloc] initWithLigne:aLigne];
    
    UITableViewController *theViewController;	
	theViewController = [[StationParLigneTableViewController alloc] initWithDataSource:dSource];
    
	// set the element for the controller
	//stationController.station = station;
	
	// push the element view controller onto the navigation stack to display it
	[[self navigationController] pushViewController:theViewController animated:YES];
    [dSource release];
	[theViewController release];
    
}




@end
