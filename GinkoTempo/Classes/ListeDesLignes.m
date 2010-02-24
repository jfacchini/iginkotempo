//
//  ListeDesStations.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ListeDesLignes.h"
#import "LignesController.h"
#import "LigneTableViewCell.h"

@implementation ListeDesLignes

// Nom de la page
- (NSString *)name {
	return @"Lignes";
}

// Nom dans la TabBar
- (NSString *)navigationBarName {
	return @"Liste des lignes";
}

// Aucune idée de ce à quoi ça sert
- (BOOL)showDisclosureIcon {
	return NO;
}

// Icone dans la TabBar
- (UIImage *)tabBarImage {
	return [UIImage imageNamed:@"Ginko.png"];
}

// atomic name is displayed in a plain style tableview
- (UITableViewStyle)tableViewStyle {
	return UITableViewStylePlain;
};


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[LignesController sharedLignesController] lignesDictionary] count];
}

// return the atomic element at the index 
- (Ligne *)LignesForIndexPath:(NSIndexPath *)indexPath {
    
    return [[[LignesController sharedLignesController] ligneNameIndexArray] objectAtIndex:indexPath.row];
	// return [[[PeriodicElements sharedPeriodicElements] elementsWithInitialLetter:[[[PeriodicElements sharedPeriodicElements] elementNameIndexArray] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
}  

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LignesTableViewCell *cell = (LignesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"LignesTableViewCell"];
    if (cell == nil) {
        cell = [[[LignesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LignesTableViewCell"] autorelease];
    }
    
    // configure cell contents
    // all the rows should show the disclosure indicator
    if ([self showDisclosureIcon])
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // set the element for this cell as specified by the datasource. The atomicElementForIndexPath: is declared
    // as part of the ElementsDataSource Protocol and will return the appropriate element for the index row
    cell.ligne = [self LignesForIndexPath:indexPath];
    
    
    cell.labelView.text = @"Cool";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)dealloc {
    [super dealloc];
}


@end
