//
//  ListeDesStationsPourUneLigne.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ListeDesStationsPourUneLigne.h"
#import "StationsParLigneController.h"
#import "StationTableViewCell.h"

@implementation ListeDesStationsPourUneLigne

@synthesize ligne;

-(id)initWithLigne:(Ligne *)aLigne{
    if (self = [super init]) {
        ligne = aLigne;
    }

    return self;
}

// Aucune idée de ce à quoi ça sert
- (BOOL)showDisclosureIcon {
	return YES;
}

// atomic name is displayed in a plain style tableview
- (UITableViewStyle)tableViewStyle {
	return UITableViewStylePlain;
};


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // this table has only one section
	return 1;
}

// return the atomic element at the index 
- (Station *)StationForIndexPath:(NSIndexPath *)indexPath {
    
    return [[[StationsParLigneController sharedStationsController:ligne] stationNameByOrder] objectAtIndex:indexPath.row];
    
} 


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    cell.station = [self StationForIndexPath:indexPath];
    
    cell.labelView.text = cell.station.name;
    
    return cell;
    
}



- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return index;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[StationsParLigneController sharedStationsController:ligne] stationsDictionary] count];
}




- (void)dealloc {
    [super dealloc];
}


@end
