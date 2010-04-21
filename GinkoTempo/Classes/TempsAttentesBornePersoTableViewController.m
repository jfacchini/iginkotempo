//
//  TempsAttentesBornePersoTableViewController.m
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 02/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TempsAttentesBornePersoTableViewController.h"
#import "ListeTempsAttentesBornePerso.h"
#import "TempsAttentesBornePersoController.h"
#import "chargementView.h"

#import "TempsAttentes.h"
#import "TempsAttentesDetailsViewController.h"

@implementation TempsAttentesBornePersoTableViewController

@synthesize theTableView;
@synthesize dataSource;
@synthesize timer;
@synthesize timerChrono;
@synthesize tempsAttente;
@synthesize chrono;
@synthesize date;
@synthesize activityIndicator;
@synthesize rafraichir;


- (id)initWithDataSource:(id<GinkoDataSource,UITableViewDataSource>)theDataSource {
    
    if ([self init]) {
        
        [NSThread detachNewThreadSelector:@selector(loadData) toTarget:self withObject:nil];
        
        theTableView = nil;
        
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
        
        //On genère le bouton en flexible item et rafraichir comme un bouton refresh
        rafraichir = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshData)];
        rafraichir.style = UIBarButtonItemStylePlain;
        
        // Bouton style refresh par default, sinon faire initWithTitle:style:target:action
        self.navigationItem.rightBarButtonItem = rafraichir;
        
        // Texte avec date de dernière mise à jours
        tempsAttente = [[UILabel alloc] initWithFrame:CGRectMake(10,0, 280, 20)];
        
        activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(290,0, 20, 20)];
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        
    }
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    
    timer = [NSTimer scheduledTimerWithTimeInterval:30.0 target:self selector:@selector(refreshData) userInfo:nil repeats:YES];

    // force the tableview to load
    [theTableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated {
    [timer invalidate];
    //[timerChrono invalidate];
    
}



//Ca c'est le code pour charger les données. A mettre dans un Thread pour pas bloquer l'affichage de la page.
-(void)loadData {
    
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    self.dataSource = [[ListeTempsAttentesBornePerso alloc] init];
    
    [self performSelectorOnMainThread:@selector(displayData) withObject:nil waitUntilDone:NO];
    
    
    [pool release];
    
}

// This is display from a Thread to a performSelctorOnMainThread
- (void)displayData {
    
    NSMutableString *titre;
    
    UIView *viewGlobale = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    viewGlobale.backgroundColor = [UIColor blackColor];
    
    
    date = [NSDate date];
    
    NSLocale *localeFR = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    NSDateFormatter *formatDate = [[NSDateFormatter alloc] init];
    
    [formatDate setTimeStyle:NSDateFormatterMediumStyle];
    [formatDate setDateStyle:NSDateFormatterNoStyle];
    [formatDate setLocale:localeFR];
    
    titre = [NSMutableString stringWithString: @"Dernière mise à jour : "];
    [titre appendFormat:[formatDate stringFromDate:date]];
    
    tempsAttente.text = titre;
    
    tempsAttente.backgroundColor = [UIColor blackColor];
    tempsAttente.textColor = [UIColor whiteColor];
    tempsAttente.font = [UIFont boldSystemFontOfSize:12.0];
    
    [viewGlobale addSubview:tempsAttente];
    
    
    // On rajoute la roulette de temps
    [viewGlobale addSubview: activityIndicator];
    
    
    // create a new table using the full application frame
    // we'll ask the datasource which type of table to use (plain or grouped)
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,20, 320, 440) 
                                                          style:[dataSource tableViewStyle]];
    
    // set the autoresizing mask so that the table will always fill the view
    tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    
    // set the cell separator to a single straight line.
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // set the tableview delegate to this object and the datasource to the datasource which has already been set
    tableView.delegate = self;
    tableView.dataSource = dataSource;
    
    // set the tableview as the controller view
    self.theTableView = tableView;
    self.theTableView.rowHeight = 65.0;
    
    
    [viewGlobale addSubview:tableView];
    
    self.view = viewGlobale;
    
    [tableView release];
}

-(void)refreshData {
    
    if (![activityIndicator isAnimating]) {
        [activityIndicator startAnimating];
        
        [NSThread detachNewThreadSelector:@selector(refreshDataThread) toTarget:self withObject:nil];
        
    }
    
}

-(void)refreshDataThread {
    
    NSMutableString *titre;
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    [[TempsAttentesBornePersoController sharedTempsAttentesBornePersoController] setupTempsAttentesBornePersoArray];
    
    date = [NSDate date];
    
    NSLocale *localeFR = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    NSDateFormatter *formatDate = [[NSDateFormatter alloc] init];
    
    [formatDate setTimeStyle:NSDateFormatterMediumStyle];
    [formatDate setDateStyle:NSDateFormatterNoStyle];
    [formatDate setLocale:localeFR];
    
    titre = [NSMutableString stringWithString: @"Dernière mise à jour : "];
    [titre appendFormat:[formatDate stringFromDate:date]];
    
    tempsAttente.text = titre;
    
    
    //Permet de mettre à jours les valeurs de la view
    [theTableView reloadData];
    
    [activityIndicator stopAnimating];
    
    
    [pool release];
    
}

- (void)loadView {
    chargementView *view = [[chargementView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    //On démarre la roulette du template view
    [[view activityIndicator] startAnimating];
    
    self.view = view;
    
    [view release];
    
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    theTableView.delegate = nil;
    theTableView.dataSource = nil;
    [theTableView release];
    [dataSource release];
    [super dealloc];
}

//
// UITableViewDelegate methods
//
//

// the user selected a row in the table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {
    
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
    
    TempsAttentes *temps = [dataSource objectForIndexPath:newIndexPath];
    
    //printf("%s\n", [temps.direction1 cStringUsingEncoding:NSUTF8StringEncoding]);
    
    TempsAttentesDetailsViewController *detailsView = [[TempsAttentesDetailsViewController alloc] initWithTempsAttentes:temps];
    
    [[self navigationController] pushViewController:detailsView animated:YES];
    
    [detailsView release];
    
    
}


@end

