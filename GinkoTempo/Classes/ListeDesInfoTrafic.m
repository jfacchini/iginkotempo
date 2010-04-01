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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)Section {
    NSMutableString *titre = nil;
    
    NSLocale *localeFR = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    NSDate *mnt = [NSDate date]; // Date actuelle
    NSDateFormatter *formatDate = [[NSDateFormatter alloc] init];
    
    [formatDate setTimeStyle:NSDateFormatterShortStyle];
    [formatDate setDateStyle:NSDateFormatterShortStyle];
    [formatDate setLocale:localeFR];
    
    if (Section == 0) {
        titre = [NSMutableString stringWithString: @"Infos trafic au "];
        [titre appendFormat:[formatDate stringFromDate:mnt]];
    }
    
    [localeFR release];
    [formatDate release];
    
    return titre;
}

// Retourne l'InfoTrafic correspond à l'indexPath
- (id)objectForIndexPath:(NSIndexPath *)indexPath {
    
    return [[[InfoTraficController sharedInfoTraficController] InfosTraficArray] objectAtIndex:indexPath.row];
    
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InfoTrafic *uneIT;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
    }
    
    // configure cell contents
    // all the rows should show the disclosure indicator
    if ([self showDisclosureIcon])
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    uneIT = [self objectForIndexPath:indexPath];
    
    cell.textLabel.text = uneIT.titre;
    
    if (uneIT.priorite) [cell.textLabel setTextColor:[UIColor redColor]];
    
    [cell.textLabel setFont:[UIFont boldSystemFontOfSize:15]];
    cell.textLabel.numberOfLines = 2;
    
    return cell;
}

- (void) dealloc {
    [super dealloc];
}

@end
