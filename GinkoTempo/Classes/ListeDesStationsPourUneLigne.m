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
	return NO;
}

// atomic name is displayed in a plain style tableview
- (UITableViewStyle)tableViewStyle {
	return UITableViewStylePlain;
};

// return the atomic element at the index 
- (Station *)StationForIndexPath:(NSIndexPath *)indexPath {
    
    return [[[StationsParLigneController sharedStationsController:ligne] stationsWithInitialLetter:[[[StationsParLigneController sharedStationsController:ligne] stationNameIndexArray] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // this table has multiple sections. One for each unique character that an element begins with
    // [A,B,C,D,E,F,G,H,I,K,L,M,N,O,P,R,S,T,U,V,X,Y,Z]
    // return the count of that array
    return [[[StationsParLigneController sharedStationsController:ligne] stationNameIndexArray] count];
}



- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    // returns the array of section titles. There is one entry for each unique character that an element begins with
    // [A,B,C,D,E,F,G,H,I,K,L,M,N,O,P,R,S,T,U,V,X,Y,Z]
    return [[StationsParLigneController sharedStationsController:ligne] stationNameIndexArray];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return index;
}


- (NSInteger)tableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section {
    // the section represents the initial letter of the element
    // return that letter
    NSString *initialLetter = [[[StationsParLigneController sharedStationsController:ligne] stationNameIndexArray] objectAtIndex:section];
    
    // get the array of elements that begin with that letter
    NSArray *elementsWithInitialLetter = [[StationsParLigneController sharedStationsController:ligne] stationsWithInitialLetter:initialLetter];
    
    // return the count
    
    return [elementsWithInitialLetter count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // this table has multiple sections. One for each unique character that an element begins with
    // [A,B,C,D,E,F,G,H,I,K,L,M,N,O,P,R,S,T,U,V,X,Y,Z]
    // return the letter that represents the requested section
    // this is actually a delegate method, but we forward the request to the datasource in the view controller
    
    return [[[StationsParLigneController sharedStationsController:ligne] stationNameIndexArray] objectAtIndex:section];
}



- (void)dealloc {
    [super dealloc];
}


@end
