//
//  GinkoDataSourceProtocol.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Station.h"

/*
 
 C'est une classe abstraite (protocol) pour définir un objet qui correspond
 si j'ai bien compris à une view de l'un des onglets.
 
 */
@protocol GinkoDataSource <NSObject>

@required

// these properties are used by the view controller
// for the navigation and tab bar
@property (readonly) NSString *name;
@property (readonly) NSString *navigationBarName;
@property (readonly) UIImage *tabBarImage;

// this property determines the style of table view displayed
@property (readonly) UITableViewStyle tableViewStyle;

// provides a standardized means of asking for the element at the specific
// index path, regardless of the sorting or display technique for the specific
// datasource
- (Station *)StationForIndexPath:(NSIndexPath *)indexPath;
- (BOOL)showDisclosureIcon;
- (UITableViewController *) getViewController;

@optional

// this optional protocol allows us to send the datasource this message, since it has the 
// required information
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;

@end
