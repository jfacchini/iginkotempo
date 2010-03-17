//
//  GinkoTempoAppDelegate.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "GinkoTempoAppDelegate.h"
#import "ListeDesStations.h"
#import "ListeDesLignes.h"
#import "ListeDesInfoTrafic.h"
#import "StationsTableViewController.h"
#import "GeolocalisationTableViewController.h"
#import "LignesTableViewController.h"
#import "InfoTraficTableViewController.h"
#import "WebserviceUtils.h"

#import "InfoTraficController.h"
#import "StationsController.h"
#import "ListeGeolocalise.h"
#import "LignesController.h"

@implementation GinkoTempoAppDelegate

@synthesize window;
@synthesize tabBarController;

// On initialise les variables à nil
- init {
	if (self = [super init]) {
		// initialize  to nil
		window = nil;
		tabBarController = nil;
	}
	return self;
}

// Methode pour eviter la repetition du code pour lier une view à un bouton
// de la TabBar (Copier/coller d'un tuto).
- (UINavigationController *)newNavigationControllerWrappingViewControllerForDataSourceOfClass:(Class)datasourceClass 
                                                                           withViewController:(Class)viewController
{
	// this is entirely a convenience method to reduce the repetition of the code
	// in the setupPortaitUserInterface
	// it returns a retained instance of the UINavigationController class. This is unusual, but 
	// it is necessary to limit the autorelease use as much as possible.
	
	// for each tableview 'screen' we need to create a datasource instance (the class that is passed in)
	// we then need to create an instance of ElementsTableViewController with that datasource instance
	// finally we need to return a UINaviationController for each screen, with the ElementsTableViewController
	// as the root view controller.
	
	// many of these require the temporary creation of objects that need to be released after they are configured
	// and factoring this out makes the setup code much easier to follow, but you can still see the actual
	// implementation here
    
	
	// the class type for the datasource is not crucial, but that it implements the 
	// ElementsDataSource protocol and the UITableViewDataSource Protocol is.
	id<GinkoDataSource,UITableViewDataSource> dataSource = [[datasourceClass alloc] init];
	
	// create the ElementsTableViewController and set the datasource
	UITableViewController *theViewController;	
	theViewController = [[viewController alloc] initWithDataSource:dataSource];
	
	// create the navigation controller with the view controller
	UINavigationController *theNavigationController;
	theNavigationController = [[UINavigationController alloc] initWithRootViewController: theViewController];
	
	// before we return we can release the dataSource (it is now managed by the ElementsTableViewController instance
	[dataSource release];
	
	// and we can release the viewController because it is managed by the navigation controller
	[theViewController release];
	

    
	return theNavigationController;
}


- (void)setupUserInterface {

    /*
     * On initialise la frame principale
     *
     */
    
    // Pas encore sur de ce a quoi cela sert, mais il le faut plusieurs fois
    UINavigationController *localNavigationController;
    
    // On initialise un UIWindow pour le copier sur celui de l'appli
    UIWindow *localPortraitWindow;
    // On l'initialise
    localPortraitWindow = [[UIWindow alloc] 
                           initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = localPortraitWindow;
    
    // Plus besoin d'une variabe locale donc on la libère.
    [localPortraitWindow release];
    
    [window setBackgroundColor:[UIColor whiteColor]];

    
    /*
     * On s'occupe de créer la TabBar de la vue.
     *
     */
    

    
    // On initialise tabBarController.
    tabBarController = [[UITabBarController alloc] init];
    // On en créer un temporaire puis le copie.
	NSMutableArray *localViewControllersArray = [[NSMutableArray alloc] 
                                                 initWithCapacity:2];

    [StationsController sharedStationsController];
    [LignesController sharedLignesController];
    //[InfoTraficController sharedInfoTraficController];

    // Bouton 1
	localNavigationController = [self newNavigationControllerWrappingViewControllerForDataSourceOfClass:[ListeDesStations class] withViewController:[StationsTableViewController class]];
    [localViewControllersArray addObject:localNavigationController];
    
    [localNavigationController release];
    
    
    // Bouton 2
    localNavigationController = [self newNavigationControllerWrappingViewControllerForDataSourceOfClass:[ListeDesLignes class] withViewController:[LignesTableViewController class]];
	[localViewControllersArray addObject:localNavigationController];
    
    [localNavigationController release];

    
    // Bouton 3
    localNavigationController = [self newNavigationControllerWrappingViewControllerForDataSourceOfClass:[ListeGeolocalise class] withViewController:[GeolocalisationTableViewController class]];
    [localViewControllersArray addObject:localNavigationController];
    
    [localNavigationController release];
    
    
    // Controller du Bouton 4 : les Infos trafic
    localNavigationController = [self newNavigationControllerWrappingViewControllerForDataSourceOfClass:[ListeDesInfoTrafic class] withViewController:[InfoTraficTableViewController class]];
    [localViewControllersArray addObject:localNavigationController];
    
    [localNavigationController release];

    
    // On attribut la liste des controllers, correspondant aux boutons
    // de la tabBar, au controller de la barre d'onglet.
    tabBarController.viewControllers = localViewControllersArray;
    
    // On libère le tableau de bouton
    [localViewControllersArray release];
    

    //On met la TabBar dans la fenêtre
    [window addSubview:tabBarController.view];
    
    // On affiche la fenetre dans l'appli.
    [window makeKeyAndVisible];
    

}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // configure the portrait user interface (pas de landscape, juste portrait)
	[self setupUserInterface];
    
    // Override point for customization after application launch
    // [window makeKeyAndVisible];
    

}

// On libere la memoire a la fin de l'application
- (void)dealloc {
    
    [tabBarController release];
    [window release];
    [super dealloc];
}


@end
