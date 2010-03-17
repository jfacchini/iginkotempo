//
//  StationsTableViewController.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StationsTableViewController.h"
#import "TempsAttentesLignesParStationViewController.h"
#import "TempsAttentesController.h"
#import "ListeDesStations.h"
#import "GinkoTempoAppDelegate.h"
#import "Station.h"

@implementation StationsTableViewController

// Donne accèsaux variables
@synthesize theTableView;
@synthesize dataSource;

/*
 * On initialise la view avec les données de GinkoDataSource
 */
// this is the custom initialization method for the ElementsTableViewController
// it expects an object that conforms to both the UITableViewDataSource protocol
// which provides data to the tableview, and the ElementDataSource protocol which
// provides information about the elements data that is displayed,

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
    
    tableView.sectionIndexMinimumDisplayRowCount=10;
    
    // set the tableview as the controller view
    self.theTableView = tableView;
    self.view = tableView;
    [tableView release];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    // force the tableview to load
    
    [theTableView reloadData];
}

/*
- (void)transitionDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {

	// re-enable user interaction when the flip is completed.
	//containerView.userInteractionEnabled = YES;
	//flipIndicatorButton.userInteractionEnabled = YES;
    
}
*/

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
	Station *station = [dataSource objectForIndexPath:newIndexPath];
	
    id dSource = [[TempsAttentesLignesParStation alloc] initWithStation:station];

    // create an AtomicElementViewController. This controller will display the full size tile for the element
	TempsAttentesLignesParStationViewController *stationController = [[TempsAttentesLignesParStationViewController alloc] initWithDataSource:dSource];
    
    
	// set the element for the controller
	//stationController.station = station;
	
	// push the element view controller onto the navigation stack to display it
	[[self navigationController] pushViewController:stationController animated:YES];
	[stationController release];
     
}





@end


