//
//  ListeDesStationsPourUneLigne.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TempsAttentesLignesParStation.h"
#import "TempsAttentesController.h"
#import "TempsAttentesTableViewCell.h"
#import "TempsAttentes.h"

@implementation TempsAttentesLignesParStation

@synthesize station;
@synthesize tempsAttentesController;

-(id)initWithStation:(Station *)aStation{
    if (self = [super init]) {
        station = aStation;
        tempsAttentesController = [[TempsAttentesController alloc] initWithStation:aStation];
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
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // this table has only one section
	return 1;
}

// return the atomic element at the index 
- (TempsAttentes *)ObjectForIndexPath:(NSIndexPath *)indexPath {
    
    return [[tempsAttentesController tempsAttentesSortedByNumber] objectAtIndex:indexPath.row];
    
} 


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TempsAttentesTableViewCell *cell = (TempsAttentesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"StationTableViewCell"];
    if (cell == nil) {
        cell = [[[TempsAttentesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StationTableViewCell"] autorelease];
    }
    
    // configure cell contents
    // all the rows should show the disclosure indicator
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // set the element for this cell as specified by the datasource. The atomicElementForIndexPath: is declared
    // as part of the ElementsDataSource Protocol and will return the appropriate element for the index row
    
    [cell setElement:[self ObjectForIndexPath:indexPath]];
    
    //cell.labelView.text = cell.temps.ligne.direction;
    
    
    return cell;
}



- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return index;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[tempsAttentesController tempsAttentesDictionary] count];
}




- (void)dealloc {
    [station dealloc];
    [tempsAttentesController dealloc];
    [super dealloc];
}


@end
