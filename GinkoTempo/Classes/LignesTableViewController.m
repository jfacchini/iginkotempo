//
//  LignesTableViewController.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LignesTableViewController.h"
#import "ListeDesLignes.h"
#import "GinkoTempoAppDelegate.h"
#import "Ligne.h"

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
        temporaryBarButtonItem.title=@"Back";
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {
    

    
}



@end
