//
//  ParametresTableViewController.m
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 31/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ParametresTableViewController.h"


@implementation ParametresTableViewController

@synthesize theTableView;
@synthesize dataSource;

- (id)initWithDataSource:(id<GinkoDataSource,UITableViewDataSource>)theDataSource {
    
    if ([self init]) {
        
        theTableView = nil;
        
        self.dataSource = theDataSource;
        
        self.title = [dataSource name];
        self.tabBarItem.image = [dataSource tabBarImage];
        
        self.navigationItem.title=[dataSource navigationBarName];
        
        UIBarButtonItem *temporaryBarButtonItem=[[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title=@"Retour";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [temporaryBarButtonItem release];
        
    }
    
    return self;
}

-(void)loadView {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] 
                                                          style:UITableViewStyleGrouped];
    
    // set the autoresizing mask so that the table will always fill the view
    tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    
    // set the cell separator to a single straight line.
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    tableView.delegate = self;
    tableView.dataSource = dataSource;
    
    self.theTableView = tableView;
    self.view = tableView;
    [tableView release];
}

-(void)dealloc {
    theTableView.delegate = nil;
    [theTableView release];
    [super dealloc];
}

@end
