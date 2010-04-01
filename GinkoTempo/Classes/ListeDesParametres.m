//
//  ListeDesParametres.m
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 01/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ListeDesParametres.h"


@implementation ListeDesParametres

// Nom de la page
- (NSString *)name {
	return @"Paramètres";
}

// Nom dans la TabBar
- (NSString *)navigationBarName {
	return @"Paramètres";
}

// Indique s'il faut afficher la petite fleche sur la droite
- (BOOL)showDisclosureIcon {
	return NO;
}

// Icone dans la TabBar
- (UIImage *)tabBarImage {
	return [UIImage imageNamed:@"Ginko.png"];
}

// atomic name is displayed in a plain style tableview
- (UITableViewStyle)tableViewStyle {
	return UITableViewStyleGrouped;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// this table has only one section
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)Section {
    NSString *titre = nil;
    
    if (Section == 0) {
        titre = @"Identifants";
    }
    
    return titre;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)Section {
    return 2; // Pour le moment, on paramètre ID + MDP.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Login";
    }
    
    if (indexPath.row == 1) {
        cell.textLabel.text = @"Mot de passe";
    }
    
    return cell;
}

-(id)objectForIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void) dealloc {
    [super dealloc];
}

@end
