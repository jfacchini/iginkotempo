//
//  ListeDesInfoTrafic.m
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 07/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ListeDesInfoTrafic.h"
#import "InfoTrafic.h"
#import "InfoTraficController.h"


@implementation ListeDesInfoTrafic

// Nom de la page
- (NSString *)name {
	return @"Infos trafic";
}

// Nom dans la TabBar
- (NSString *)navigationBarName {
	return @"Infos trafic";
}

// Indique s'il faut afficher la petite fleche sur la droite
- (BOOL)showDisclosureIcon {
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// this table has only one section
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)Section {
    return [[[InfoTraficController sharedInfoTraficController] InfosTraficArray] count];
}

// Retourne l'InfoTrafic correspond à l'indexPath
- (InfoTrafic *)infoTraficForIndexPath:(NSIndexPath *)indexPath {
    
    return [[[InfoTraficController sharedInfoTraficController] InfosTraficArray] objectAtIndex:indexPath.row];
    
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
    }
    
    // configure cell contents
    // all the rows should show the disclosure indicator
    if ([self showDisclosureIcon])
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = [self infoTraficForIndexPath:indexPath].titre;
    
    return cell;
}

- (void) dealloc {
    [super dealloc];
}

@end
