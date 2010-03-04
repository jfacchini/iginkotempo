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
#import "Ligne.h"

@implementation ListeDesLignes

// Nom de la page
- (NSString *)name {
	return @"Lignes";
}

// Nom dans la TabBar
- (NSString *)navigationBarName {
	return @"Liste des lignes";
}

// C'est la flèche sur le coté !!!
- (BOOL)showDisclosureIcon
{
	return YES;
}

// Icone dans la TabBar
- (UIImage *)tabBarImage {
	return [UIImage imageNamed:@"Borne.png"];
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
    return [[[LignesController sharedLignesController] ligneSortedByNumber] count];
}

// return the atomic element at the index 
- (Ligne *)LignesForIndexPath:(NSIndexPath *)indexPath {
    
    return [[[LignesController sharedLignesController] ligneSortedByNumber] objectAtIndex:indexPath.row];
	
    // return [[[PeriodicElements sharedPeriodicElements] elementsWithInitialLetter:[[[PeriodicElements sharedPeriodicElements] elementNameIndexArray] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
}  

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LigneTableViewCell *cell = (LigneTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"LigneTableViewCell"];

    if (cell == nil) {
        cell = [[[LigneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LigneTableViewCell"] autorelease];
    }
    
    // configure cell contents
    // all the rows should show the disclosure indicator
    if ([self showDisclosureIcon])
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // set the element for this cell as specified by the datasource. The atomicElementForIndexPath: is declared
    // as part of the ElementsDataSource Protocol and will return the appropriate element for the index row
    cell.ligne = [self LignesForIndexPath:indexPath];
        
    cell.labelView.text = cell.ligne.direction;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)dealloc {
    [super dealloc];
}


@end
