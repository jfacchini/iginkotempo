//
//  StationParLigneViewController.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 05/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StationParLigneTableViewController.h"
#import "TempsAttentesLignesParStationViewController.h"
#import "TempsAttentesController.h"
#import "chargementView.h"


@interface StationParLigneTableViewController(mymethods)
// these are private methods that outside classes need not use
-(void)loadData:(id)aLigne;
-(void)displayData;
@end


@implementation StationParLigneTableViewController

@synthesize theTableView;
@synthesize dataSource;

- (id)initWithLigne:(Ligne *)aLigne{
    
    if ([self init]) {
        
        theTableView = nil;
        
        
        [NSThread detachNewThreadSelector:@selector(loadData:) toTarget:self withObject:aLigne];
        
        // retain the data source
        // set the title, and tab bar images from the dataSource
        // object. These are part of the ElementsDataSource Protocol
        
        
        //dataSource.ligne.numero + dataSource.ligne.direction;
        self.title = [NSString stringWithFormat:@"%@ %@",aLigne.numero,aLigne.direction];

        // set the long name shown in the navigation bar
        //self.navigationItem.title=[dataSource navigationBarName];
        
        // create a custom navigation bar button and set it to always say "back"
        UIBarButtonItem *temporaryBarButtonItem=[[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title=@"Retour";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [temporaryBarButtonItem release];
        
    }
    
    return self;
}

//Ca c'est le code pour charger les données. A mettre dans un Thread.
-(void)loadData:(id)aLigne {
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    [[StationsParLigneController sharedStationsParLigneController:aLigne] setLigne:aLigne];
    
    self.dataSource = [[ListeDesStationsPourUneLigne alloc] initWithLigne:aLigne];
    [self displayData];
    
    [pool release];
    
}

//Une fois les données chargées, on affiche le résultat avec cette fonction
- (void)displayData {
    
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
    
    tableView.sectionIndexMinimumDisplayRowCount=10;
    
    // set the tableview as the controller view
    self.theTableView = tableView;
    self.view = tableView;
    [tableView release];
}

- (void)loadView {
    
    chargementView *view = [[chargementView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];

    [[view activityIndicator] startAnimating];
    
    //UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.view = view;
    
    
    [view release];
}

-(void)viewWillAppear:(BOOL)animated
{
    
    // force the tableview to load
    [theTableView reloadData];
}



//
//
// UITableViewDelegate methods
//
//

// the user selected a row in the table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {
    
	// deselect the new row using animation
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
	    
	// get the element that is represented by the selected row.
	Station *station = [dataSource StationForIndexPath:newIndexPath];
    	
    //id dSource = [[TempsAttentesLignesParStation alloc] initWithStation:station];
    
    // create an AtomicElementViewController. This controller will display the full size tile for the element
	TempsAttentesLignesParStationViewController *stationController = [[TempsAttentesLignesParStationViewController alloc] initWithStation:station];
    
    
	// set the element for the controller
	//stationController.station = station;
	
	// push the element view controller onto the navigation stack to display it
	[[self navigationController] pushViewController:stationController animated:YES];
	[stationController release];  
    
}


- (void)dealloc {
    theTableView.delegate = nil;
    theTableView.dataSource = nil;
    [theTableView release];
    [dataSource release];
    [super dealloc];
}




@end
