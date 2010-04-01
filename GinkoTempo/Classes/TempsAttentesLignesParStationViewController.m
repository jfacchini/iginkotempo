//
//  StationParLigneViewController.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 05/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>



#import "TempsAttentesLignesParStationViewController.h"
#import "TempsAttentesController.h"
#import "Station.h"
#import "chargementView.h"

@interface TempsAttentesLignesParStationViewController(mymethods)
// these are private methods that outside classes need not use
-(void)loadData:(id)aStation;
-(void)displayData;
@end

@implementation TempsAttentesLignesParStationViewController

@synthesize theTableView;
@synthesize dataSource;

- (id)initWithStation:(Station *)aStation {
    
    if ([self init]) {
        
        theTableView = nil;
        
        [NSThread detachNewThreadSelector:@selector(loadData:) toTarget:self withObject:aStation];

        
        //id dSource = [[TempsAttentesLignesParStation alloc] initWithStation:station];
        
        // retain the data source
        //self.dataSource = dSource;
        // set the title, and tab bar images from the dataSource
        // object. These are part of the ElementsDataSource Protocol
        self.title = aStation.name;
        
        
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
-(void)loadData:(id)aStation {
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    //[[StationsParLigneController sharedStationsParLigneController:aLigne] setLigne:aLigne];
    
    //self.dataSource = [[ListeDesStationsPourUneLigne alloc] initWithLigne:aLigne];
    
    
    self.dataSource = [[TempsAttentesLignesParStation alloc] initWithStation:aStation];
    [self displayData];
    
    [pool release];
    
}



- (void)dealloc {
    theTableView.delegate = nil;
    theTableView.dataSource = nil;
    [theTableView release];
    [dataSource release];
    [super dealloc];
}

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
    
    // set the tableview as the controller view
    self.theTableView = tableView;
    self.theTableView.rowHeight = 58.0;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Configure the table view.
    
    
    /*
    self.tableView.backgroundColor = DARK_BACKGROUND;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
	// Load the data.
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    self.data = [NSArray arrayWithContentsOfFile:dataPath];
     */
    
}//


-(void)viewWillAppear:(BOOL)animated
{
    // force the tableview to load
    [theTableView reloadData];
}




//
// UITableViewDelegate methods
//
//

// the user selected a row in the table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {
    
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
    
    [[dataSource tempsAttentesController] setupTempsAttentesArray];
    
    //Permet de mettre à jours les valeurs de la view
    [theTableView reloadData];
    

}



@end
