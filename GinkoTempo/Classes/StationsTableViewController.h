//
//  StationsTableViewController.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GinkoDataSourceProtocol.h"

@class Station;


@interface StationsTableViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate> {

	UITableView *theTableView;
	id<GinkoDataSource,UITableViewDataSource> dataSource;


}

@property (nonatomic,retain) UITableView *theTableView;
@property (nonatomic,retain) id<GinkoDataSource,UITableViewDataSource> dataSource;


- (id)initWithDataSource:(id<GinkoDataSource,UITableViewDataSource>)theDataSource;


@end
