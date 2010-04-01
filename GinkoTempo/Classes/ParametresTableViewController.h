//
//  ParametresTableViewController.h
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 31/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GinkoDataSourceProtocol.h"


@interface ParametresTableViewController : UITableViewController {
    UITableView *theTableView;
    id<GinkoDataSource,UITableViewDataSource> dataSource;
}

@property (nonatomic,retain) UITableView *theTableView;
@property (nonatomic,retain) id<GinkoDataSource,UITableViewDataSource> dataSource;

- (id)initWithDataSource:(id<GinkoDataSource,UITableViewDataSource>)theDataSource;

@end
