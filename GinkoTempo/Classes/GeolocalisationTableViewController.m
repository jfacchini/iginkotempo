//
//  LignesTableViewController.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GeolocalisationTableViewController.h"
#import "LignesTableViewController.h"
#import "ListeDesLignes.h"
#import "GinkoTempoAppDelegate.h"
#import "Ligne.h"
#import "StationParLigneTableViewController.h"


#import "StationsGeolocaliseController.h";
#import "TempsAttentesLignesParStation.h"
#import "TempsAttentesLignesParStationViewController.h"

//Si on click sur une ligne, go liste des Stations de la ligne
#import "ListeDesStationsPourUneLigne.h"


@implementation GeolocalisationTableViewController

// Donne accès aux variables
@synthesize theTableView;
@synthesize localiser;
@synthesize dataSource;
@synthesize locManager;


- (id)initWithDataSource:(id<GinkoDataSource,UITableViewDataSource>)theDataSource {
    
    if ([self init]) {
        
        theTableView = nil;
        enCoursDeGeolocalisation = NO;
        locManager = [[CLLocationManager alloc] init];
        [locManager setDelegate:self];
        
        // retain the data source
        self.dataSource = theDataSource;
        // set the title, and tab bar images from the dataSource
        // object. These are part of the ElementsDataSource Protocol
        self.title = [dataSource name];
        self.tabBarItem.image = [dataSource tabBarImage];
        
        // set the long name shown in the navigation bar
        self.navigationItem.title=[dataSource navigationBarName];
        
        
        // create a custom navigation bar button and set it to always say "back"
        UIBarButtonItem *temporaryBarButtonItem=[[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title=@"Retour";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [temporaryBarButtonItem release];

        
        // Bouton style refresh par default, sinon faire initWithTitle:style:target:action
        localiser = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(startStopLocalisation)];
        self.navigationItem.rightBarButtonItem = localiser;


    }
    
    return self;
}


- (void)dealloc {
    theTableView.delegate = nil;
    theTableView.dataSource = nil;
    [theTableView release];
    [localiser release];
    [dataSource release];
    [super dealloc];
}


-(void)viewDidLoad {
    //Il faut activer une fois la localisation
    //[self startLocalisation];
}

- (void)loadView {    
    // create a new table using the full application frame
    // we'll ask the datasource which type of table to use (plain or grouped)
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] 
                                                          style:[dataSource tableViewStyle]];
    
    // set the autoresizing mask so that the table will always fill the view
    tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    
    // set the cell separator to a single straight line.
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // set the tableview delegate to this object and the datasource to the datasource which has already been set
    tableView.delegate = self;
    //tableView.dataSource = dataSource;
    
    //tableView.sectionIndexMinimumDisplayRowCount=10;
    
    // set the tableview as the controller view
    self.theTableView = tableView;
    self.view = tableView;
    [tableView release];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [dataSource ];
//}

// the user selected a row in the table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {
 	// deselect the new row using animation
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
	
	// get the element that is represented by the selected row.
	Station *station = [dataSource objectForIndexPath:newIndexPath];
	
    id dSource = [[TempsAttentesLignesParStation alloc] initWithStation:station];
    
    // create an AtomicElementViewController. This controller will display the full size tile for the element
	TempsAttentesLignesParStationViewController *stationController = [[TempsAttentesLignesParStationViewController alloc] initWithDataSource:dSource];
    
    
	// set the element for the controller
	//stationController.station = station;
	
	// push the element view controller onto the navigation stack to display it
	[[self navigationController] pushViewController:stationController animated:YES];
	[stationController release];
    
    
}


/*
 *
 * Ici ce sont les fonctions de gestion pour la Géolocalisation
 *
 *
 */

-(void) startStopLocalisation{

    //printf("Géolocalisation %s\n", enCoursDeGeolocalisation ? "oui" : "non");

    //Voir la doc pour savoir ce que ça fait.
    [locManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    
    if (enCoursDeGeolocalisation) {
		[locManager stopUpdatingLocation];
		enCoursDeGeolocalisation = NO;
		//[localiser setStyle:UIBarButtonSystemItemCancel];
		//[indicateurActivite stopAnimating];
	} else {
		[locManager startUpdatingLocation];
		enCoursDeGeolocalisation = YES;
		//[localiser setStyle:UIBarButtonSystemItemRefresh];
		//[indicateurActivite startAnimating];
	}

    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *) oldLocation{
	
    //NSLog(@"LocManager StartUpdate");
    
	CLLocationCoordinate2D loc = [newLocation coordinate];

    //printf("%f %f", lat, lon);
    
	// Ici on fait le traitement une fois les données récupérer   
    [[StationsGeolocaliseController sharedStationsGeolocaliseController] setLatitude:loc.latitude withLong:loc.longitude];
    
    
    // create a new table using the full application frame
    // we'll ask the datasource which type of table to use (plain or grouped)
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] 
                                                          style:[dataSource tableViewStyle]];
    
    // set the autoresizing mask so that the table will always fill the view
    tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    
    // set the cell separator to a single straight line.
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // set the tableview delegate to this object and the datasource to the datasource which has already been set
    tableView.delegate = self;
    tableView.dataSource = dataSource;
    
    //tableView.sectionIndexMinimumDisplayRowCount=10;
    
    // set the tableview as the controller view
    self.theTableView = tableView;
    self.view = tableView;
    [tableView release];
    
    enCoursDeGeolocalisation = NO;
    [locManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *) error{
	NSMutableString *messageErreur = [[[NSMutableString alloc] init] autorelease];// NSMutableString est un NSString auquel on peut rajouter du texte lorsque l'on veut
	// autorelease, car nous souhaitons ne pas nous occuper de la gestion de ce NSMutableString
	
	if ([error domain] == kCLErrorDomain) {
		
		// Il nous faut gérer les différents types d'erreurs :
		
		switch ([error code]) {
				// L'erreur suivante est généralement retournée lorsque l'utilisateur tape "Ne pas autoriser" lorsque
				// l'application lui demande si elle peut utiliser le lieu actuel. Vous devez ensuite redémarrer 
				// votre appli pour que ce message soit redemandé.
				//
				// Sachez que si vous refusez deux fois, en deux lancements successifs d'une appli, elle comprendra 
				// "Ne JAMAIS autoriser" ... Vous pouvez faire un reset : Réglages > Général > Réinitialiser > Réinitialiser alertes de localisation
				// 
			case kCLErrorDenied:
				[messageErreur  setString:@"Localisation refusee"];
				break;
				
				// Ce message d'erreur est usuellement retourné lorsque voter iPhone n'a pas établi de connexion 
				//(3G, E ou Wifi), ou lorsque l'endroit ou vous vous trouvez ne peut être déterminé
				//
				// CoreLocation va continuer d'essayer, vous pouvez donc attendre ou avertir l'utilisateur
			case kCLErrorLocationUnknown:
				[messageErreur setString:@"Localisation inconnue"];
				break;
				
				// Au cas où il y ait une erreur inconnue ...
			default:
				[messageErreur setString:@"Erreur globale localisation" ];
				break;
				
		}
	} else {
		//Nous gérons ici les erreurs ne concernant pas la localisation 
		
		[messageErreur appendFormat:@"Error domain: \"%@\"  Error code: %d\n", [error domain], [error code]];
		[messageErreur appendFormat:@"Description: \"%@\"\n", [error localizedDescription]];
	}
	
    printf("%s", [messageErreur cStringUsingEncoding:NSASCIIStringEncoding]);
	//labelInfo.text = messageErreur;
}





@end
