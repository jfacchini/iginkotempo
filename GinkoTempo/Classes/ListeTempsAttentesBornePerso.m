//
//  ListeTempsAttentesBornePerso.m
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 18/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ListeTempsAttentesBornePerso.h"
#import "TempsAttentesBornePersoController.h"
#import "StationTempsAttentesBornePerso.h"
#import "TempsAttentesTableViewCell.h"


@implementation ListeTempsAttentesBornePerso

// Nom de la page
- (NSString *)name {
	return @"Borne Perso";
}

// Nom dans la TabBar
- (NSString *)navigationBarName {
	return @"Borne Perso";
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
	return UITableViewStylePlain;
};


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// this table has only one section
	return [[TempsAttentesBornePersoController
             sharedTempsAttentesBornePersoController].tempsAttentesBornePerso count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)Section {
    StationTempsAttentesBornePerso *stabp = [[TempsAttentesBornePersoController
                                              sharedTempsAttentesBornePersoController].tempsAttentesBornePerso
                                             objectAtIndex:Section];
    return [[stabp tempsAttentes] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)Section {
    StationTempsAttentesBornePerso *stabp = [[TempsAttentesBornePersoController
                                              sharedTempsAttentesBornePersoController].tempsAttentesBornePerso
                                             objectAtIndex:Section];
    return stabp.station.name;
}

// Retourne le temps d'attente qui correspond à l'indexPath
- (id)objectForIndexPath:(NSIndexPath *)indexPath {
    
    int i = 0;
    int index = indexPath.row;
    int nbElt;
    StationTempsAttentesBornePerso *stabp;
    stabp = [[TempsAttentesBornePersoController
              sharedTempsAttentesBornePersoController].tempsAttentesBornePerso
             objectAtIndex:i];
    nbElt = [stabp.tempsAttentes count];
    
    while (nbElt < index) {
        index = index - [stabp.tempsAttentes count];
        i++;
        stabp = [[TempsAttentesBornePersoController
                  sharedTempsAttentesBornePersoController].tempsAttentesBornePerso
                 objectAtIndex:i];
        nbElt = [stabp.tempsAttentes count];
    }
    
    return [stabp.tempsAttentes objectAtIndex:index];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TempsAttentesTableViewCell *cell = (TempsAttentesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"StationTableViewCell"];
    if (cell == nil) {
        cell = [[[TempsAttentesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StationTableViewCell"] autorelease];
    }
    
    // configure cell contents
    // all the rows should show the disclosure indicator
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [cell setElement:[self objectForIndexPath:indexPath]];

    return cell;
}

- (void) dealloc {
    [super dealloc];
}

@end
