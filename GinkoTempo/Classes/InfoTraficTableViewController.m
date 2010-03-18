//
//  InfoTraficTableViewController.m
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 07/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InfoTraficTableViewController.h"
#import "InfoTraficController.h"
#import "InfoTrafic.h"
#import "DetailsInfosTraficViewController.h"


@implementation InfoTraficTableViewController

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
        
        NSNumber *nbITP = [[InfoTraficController sharedInfoTraficController] nbInfosTraficPrioritaires];
        if ([nbITP intValue] > 0) self.tabBarItem.badgeValue = [nbITP stringValue];
        
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
    
    // set the tableview as the controller view
    self.theTableView = tableView;
    self.view = tableView;
    [tableView release];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {
    
	// deselect the new row using animation
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
    
    InfoTrafic *iT = [[[InfoTraficController sharedInfoTraficController] InfosTraficArray] objectAtIndex:newIndexPath.row];
	
    // cree un controleur de vue d'une InfoTrafic.
	DetailsInfosTraficViewController *unDetailsInfosTraficController = [[DetailsInfosTraficViewController alloc] initWithInfoTrafic:iT];
	
	// push the info trafic view controller onto the navigation stack to display it
	[[self navigationController] pushViewController:unDetailsInfosTraficController animated:YES];
	[unDetailsInfosTraficController release];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
