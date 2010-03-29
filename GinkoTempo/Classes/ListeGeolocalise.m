//
//  ListeDesStations.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ListeGeolocalise.h"
#import "StationsGeolocaliseController.h"
#import "LigneTableViewCell.h"
#import "StationTableViewCell.h"
#import "Ligne.h"

@implementation ListeGeolocalise

// Nom dans la TabBar
- (NSString *)name {
	return @"Localisation";
}

//Nom dans la TabBar
- (NSString *)navigationBarName {
	return @"Géolocalisation";
}

// C'est la flèche sur le coté !!!
- (BOOL)showDisclosureIcon
{
	return YES;
}

// Icone dans la TabBar
- (UIImage *)tabBarImage {
	return [UIImage imageNamed:@"Carte.png"];
}

// atomic name is displayed in a plain style tableview
- (UITableViewStyle)tableViewStyle {
	return UITableViewStylePlain;
};


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
	// this table has only one section
	return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[StationsGeolocaliseController sharedStationsGeolocaliseController] stationNameByOrder] count];
}

// return the atomic element at the index 
- (id)objectForIndexPath:(NSIndexPath *)indexPath {
    
    return [[[StationsGeolocaliseController sharedStationsGeolocaliseController] stationNameByOrder] objectAtIndex:indexPath.row];
    
}  

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StationTableViewCell *cell = (StationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"StationTableViewCell"];
    
    if (cell == nil) {
        cell = [[[StationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StationTableViewCell"] autorelease];
    }
    
    // configure cell contents
    // all the rows should show the disclosure indicator
    if ([self showDisclosureIcon])
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // set the element for this cell as specified by the datasource. The atomicElementForIndexPath: is declared
    // as part of the ElementsDataSource Protocol and will return the appropriate element for the index row
    //cell.ligne = [self LignesForIndexPath:indexPath];
    //cell.ligneTileView.ligne = [self objectForIndexPath:indexPath];
    
    //[cell setElement: [self LignesForIndexPath:indexPath]];
    
    cell.station = [self objectForIndexPath:indexPath];
    
	cell.labelView.text = cell.station.name;
    
    //On met à jours les colonnes pour un affichage cohérent.
	[cell.labelView setNeedsDisplay];
    
    //cell.labelView.text = cell.ligne.direction;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)dealloc {
    [super dealloc];
}


@end
