//
//  TempsAttentesDetails.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TempsAttentesDetailsViewController.h"
#import "ligneDetails.h"
#import "WebserviceUtils.h"
#import "TempsAttentesBornePersoController.h"
#import <AudioToolbox/AudioToolbox.h> 

@implementation TempsAttentesDetailsViewController

@synthesize tempsAttente, globaleView, label, titleMessage,
            titleBus1, titleBus2, message, infoBus1, infoBus2, button;

- (id)initWithTempsAttentes:(TempsAttentes *)myTempsAttente inBornePerso:(Boolean *)isBornePerso
{    
    
    
    if([self init]) {
        
        self.title = myTempsAttente.station.name;
        self.tempsAttente = myTempsAttente;
        
        // ON calcule la hauteur pour la scrollView
        int height = 0;
        
        globaleView = [[UIScrollView alloc] initWithFrame:
                            CGRectMake(0, 0, 320, 460)
                            ];

        
        CGRect theFrame = CGRectMake(0, height, 320, 65);
            height += 65;
        
        /*
         *   ON AFFICHE LE HEADER DE LA PAGE
         */
        
        ligneDetails *header = [[ligneDetails alloc] initWithFrame:theFrame];
        header.temps = myTempsAttente;
        
        [globaleView addSubview:header];
        
        //On définit les fonts de la Page
        UIFont *fontTitle = [UIFont boldSystemFontOfSize:18];
        UIFont *fontTexte = [UIFont boldSystemFontOfSize:14];
        
        /*
         *   ON AFFICHE UNE INFO TRAFFIC SI IL Y EN A UNE
         */
        if (self.tempsAttente.message) {
            
            for (int i=0; i<sizeof(self.tempsAttente.message); i++) {
                
                //Afficher le message
                
                
            }
            
        }
        
        
        /*
         *   ON AFFICHE LE MESSAGE BUS 1
         */
        
        
        //On affiche le titre
        theFrame = CGRectMake(10, height, 300, fontTitle.pointSize);
        self.titleBus1 = [[UILabel alloc] initWithFrame:theFrame];
        self.titleBus1.text = @"Prochain bus";
        self.titleBus1.font = fontTitle;
    
        [globaleView addSubview:self.titleBus1];
        
            height += fontTitle.pointSize + 6; //Espace sous le titre
            
        //On affiche le texte
        self.infoBus1 = [[UILabel alloc] init];
        self.infoBus1.numberOfLines = 0;
        self.infoBus1.text = self.tempsAttente.infoComplementaire1;        
        self.infoBus1.font = fontTexte;
        self.infoBus1.lineBreakMode = UILineBreakModeWordWrap;
        
        CGSize maximumLabelSize = CGSizeMake(300,9999);
        CGSize expectedLabelSize = [self.tempsAttente.infoComplementaire1 sizeWithFont:self.infoBus1.font 
                                          constrainedToSize:maximumLabelSize 
                                              lineBreakMode:self.infoBus1.lineBreakMode];
        
        theFrame = CGRectMake(10, height, 300, expectedLabelSize.height);
        self.infoBus1.frame = theFrame;
        
        [globaleView addSubview:self.infoBus1];
        
            height += expectedLabelSize.height + 10; //Espace sous le texte

        
        
        /*
         *   ON AFFICHE LE MESSAGE BUS 2
         */
        theFrame = CGRectMake(10,height, 300, fontTitle.pointSize);
        self.titleBus2 = [[UILabel alloc] initWithFrame:theFrame];
        self.titleBus2.text = @"Deuxième Bus";
        self.titleBus2.font = fontTitle;
        
        [globaleView addSubview:self.titleBus2];
        
            height += fontTitle.pointSize + 6; //Espace sous le titre
        
        //On affiche le texte
        self.infoBus2 = [[UILabel alloc] init];
        self.infoBus2.numberOfLines = 0;
        self.infoBus2.text = self.tempsAttente.infoComplementaire2;        
        self.infoBus2.font = fontTexte;
        self.infoBus2.lineBreakMode = UILineBreakModeWordWrap;
        
        maximumLabelSize = CGSizeMake(300,9999);
        expectedLabelSize = [self.tempsAttente.infoComplementaire2 sizeWithFont:self.infoBus2.font 
                                                                     constrainedToSize:maximumLabelSize 
                                                                         lineBreakMode:self.infoBus2.lineBreakMode];
        
        theFrame = CGRectMake(10, height, 300, expectedLabelSize.height);
        self.infoBus2.frame = theFrame;
        
        [globaleView addSubview:self.infoBus2];
        
            height += expectedLabelSize.height + 10; //Espace sous le texte
        
        
        
        /*
         *  ON AFFICHE LE BOUTON
         */
        
        //Si on est dans la borne perso, on supprimer une ligne
        //Sinon on ajoute la ligne à la borne
        
        theFrame = CGRectMake(10, height, 300, 50);
        self.button = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
        self.button.frame = theFrame;
        
        if (isBornePerso) {
            
            [self.button setTitle:@"Supprimer de ma borne perso" forState:UIControlStateNormal];
            
            [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.button addTarget:self action:@selector(supprimerLigneBornePerso) forControlEvents:UIControlEventTouchUpInside];
            
        }else{
            
            [self.button setTitle:@"Ajouter à ma borne perso" forState:UIControlStateNormal];
            
            [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.button addTarget:self action:@selector(ajouterLigneBornePerso) forControlEvents:UIControlEventTouchUpInside];
            
        }

        
        [globaleView addSubview:self.button];
        
            height += 50;
        
        
        // Largeur du coutent dans la scrollView
        [globaleView setContentSize:CGSizeMake(320, height)];
        

        self.view = globaleView;
        
    }
  
    

    
    return self;
}

- (void)viewDidLoad
{

    
}

- (void)ajouterLigneBornePerso
{
    // Récupération des identifiants - ici on considère que les identifiants sont correctes
    NSString *login = (NSString *) [[NSUserDefaults standardUserDefaults] objectForKey:@"loginKey"];
    NSString *mdp = (NSString *) [[NSUserDefaults standardUserDefaults] objectForKey:@"mdpKey"];
    
    int err = [WebserviceUtils addLigneStationBornePerso:login :[TempsAttentesBornePersoController md5HashString:mdp] :self.tempsAttente.station.name :self.tempsAttente.ligne.numero :self.tempsAttente.ligne.sens];
    
    if (err == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Cette ligne a bien été ajouter à votre Borne Perso" 
                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [alert show];
        [alert release];
        
        [[self navigationController] popViewControllerAnimated:YES];
        
    }else{
        if (err == -1) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Cette ligne est déjà dans votre borne perso" 
                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            [alert show];
            [alert release];
        }else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Vous devez saisir les identifiants de votre borne perso afin de pouvoir en gérer le contenue." 
                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            [alert show];
            [alert release];
        }

        

    }
    
    

}

- (void)supprimerLigneBornePerso
{
    // Récupération des identifiants - ici on considère que les identifiants sont correctes
    NSString *login = (NSString *) [[NSUserDefaults standardUserDefaults] objectForKey:@"loginKey"];
    NSString *mdp = (NSString *) [[NSUserDefaults standardUserDefaults] objectForKey:@"mdpKey"];
    
    int err = [WebserviceUtils deleteLigneStationBornePerso:login :[TempsAttentesBornePersoController md5HashString:mdp] :self.tempsAttente.station.name :self.tempsAttente.ligne.numero :self.tempsAttente.ligne.sens];

    if (err == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Cette ligne a bien été supprimer de votre Borne Perso" 
                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [alert show];
        [alert release];
        
        [[self navigationController] popViewControllerAnimated:YES];

    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Erreur lors de la suppression" 
                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [alert show];
        [alert release];
        
    }
}


-(void)viewWillAppear:(BOOL)animated 
{

}

- (void)viewDidUnload
{

}


- (void)dealloc {
    [super dealloc];
}



@end
