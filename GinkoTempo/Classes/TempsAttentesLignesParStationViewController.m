//
//  StationParLigneViewController.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 05/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>



#import "TempsAttentesLignesParStationViewController.h"
#import "TempsAttentesController.h"
#import "Station.h"
#import "chargementView.h"
#import "TempsAttentes.h"
#import "TempsAttentesDetailsViewController.h"

@interface TempsAttentesLignesParStationViewController(mymethods)
// these are private methods that outside classes need not use
-(void)loadData;
-(void)displayData;
-(void)refreshData;
-(void)refreshDataThread;
@end

@implementation TempsAttentesLignesParStationViewController

@synthesize theTableView;
@synthesize timer;
@synthesize timerChrono;
@synthesize cmptRafraichissement;
@synthesize dataSource;
@synthesize tempsAttente;
@synthesize chrono;
@synthesize date;
@synthesize activityIndicator;
@synthesize station;
@synthesize rafraichir;


- (id)initWithStation:(Station *)aStation {
    
    if ([self init]) {
        
        theTableView = nil;
        date = [NSDate date];
        station = aStation;
        
        [NSThread detachNewThreadSelector:@selector(loadData) toTarget:self withObject:nil];
        

        //NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(loadData:) object:aStation];
        //[thread start];
        //id dSource = [[TempsAttentesLignesParStation alloc] initWithStation:station];
        
        // retain the data source
        //self.dataSource = dSource;
        // set the title, and tab bar images from the dataSource
        // object. These are part of the ElementsDataSource Protocol
        self.title = aStation.name;
        
        // set the long name shown in the navigation bar
        //self.navigationItem.title=[dataSource navigationBarName];
        
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
        
        
        

        // initialisation faite dans viewWillAppear pour reprendre le chargement.
        //cmptRafraichissement = 30;
        
        activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(290,0, 20, 20)];
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
                
    }
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
            
    timer = [NSTimer scheduledTimerWithTimeInterval:30.0 target:self selector:@selector(refreshData) userInfo:nil repeats:YES];
    //timerChrono = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshChrono) userInfo:nil repeats:YES];
    //[[NSRunLoop mainRunLoop] addTimer:timerChrono forMode: NSDefaultRunLoopMode];

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
    
    
    //[[StationsParLigneController sharedStationsParLigneController:aLigne] setLigne:aLigne];
    
    //self.dataSource = [[ListeDesStationsPourUneLigne alloc] initWithLigne:aLigne];
    
    //Station *aStation = [viewController station];
    
    
    self.dataSource = [[TempsAttentesLignesParStation alloc] initWithStation:station];
    
    //Appelle à displayData
    //Attention car [self displayData] ne fonctionne pas : erreur accès mémoire.

    [self performSelectorOnMainThread:@selector(displayData) withObject:nil waitUntilDone:NO];

    
    [pool release];
    
}



- (void)dealloc {
    theTableView.delegate = nil;
    theTableView.dataSource = nil;
    [theTableView release];
    [dataSource release];
    [tempsAttente release];
    //[activityIndicator release];
    [super dealloc];
}


// This is display from a Thread to a performSelctorOnMainThread
- (void)displayData {

    
    UIView *viewGlobale = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    viewGlobale.backgroundColor = [UIColor blackColor];
   
    
    date = [NSDate date];
    
    //NSString *formattedDate = [[NSDate date] descriptionWithCalendarFormat:@"%Y-%m-%d %H:%M:%S"];
    //[self date] descriptionWithCalendarFormat
    
    tempsAttente.text = [NSString stringWithFormat:@"Dernière mise à jour : %@",
                         [date descriptionWithCalendarFormat:@"%H:%M:%S" 
                                                                     timeZone:nil
                                                                       locale:nil]];
    
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

- (void)loadView {
    chargementView *view = [[chargementView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    //On démarre la roulette du template view
    [[view activityIndicator] startAnimating];
    
    //UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.view = view;
    
    [view release];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
}//

-(void)refreshData {

//    Commentaire d'un bout de code pour changer le bouton refresh en roue de chargement
//
//    CGRect frame = CGRectMake(0.0, 0.0, 25.0, 25.0);
//    
//    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc] initWithFrame:frame];  
//    [loading sizeToFit];  
//    loading.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);  
//    [loading startAnimating];
//    
//    rafraichir = [[UIBarButtonItem alloc] initWithCustomView:loading];
//    rafraichir.style = UIBarButtonItemStylePlain; 
//    self.navigationItem.rightBarButtonItem = rafraichir;
    
    if (![activityIndicator isAnimating]) {
        [activityIndicator startAnimating];
        
        [NSThread detachNewThreadSelector:@selector(refreshDataThread) toTarget:self withObject:nil];
        
    }
    


}

-(void)refreshDataThread {
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    [[dataSource tempsAttentesController] setupTempsAttentesArray];
    
    date = [NSDate date];
    tempsAttente.text = [NSString stringWithFormat:@"Dernière mise à jour : %@",
                         [date descriptionWithCalendarFormat:@"%H:%M:%S" 
                                                    timeZone:nil
                                                      locale:nil]];
    
    
    //Permet de mettre à jours les valeurs de la view
    [theTableView reloadData];
    
    [activityIndicator stopAnimating];
    
    
    [pool release];
    
}


//
// UITableViewDelegate methods
//
//

// the user selected a row in the table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {

    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];

    TempsAttentes *temps = [dataSource.tempsAttentesController.tempsAttentesSortedByNumber objectAtIndex:newIndexPath.row];

    //printf("%s\n", [temps.direction1 cStringUsingEncoding:NSUTF8StringEncoding]);

    TempsAttentesDetailsViewController *detailsView = [[TempsAttentesDetailsViewController alloc] initWithTempsAttentes:temps inBornePerso:NO];

    [[self navigationController] pushViewController:detailsView animated:YES];
    [detailsView release];
    
    
}



@end
