//
//  WebserviceUtils.m
//  tempoGSoap
//
//  Created by Jocelyn FACCHINI on 28/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "WebserviceUtils.h"
#import "Ligne.h"
#import "TempsAttentes.h"
#import "InfoTrafic.h"
#import "TempoApiSoapBinding.nsmap"

#define FAC 0

@interface WebserviceUtils(mymethods)

+ (void)initSoap;
+ (UIColor *) uiColorWithHexString:(NSString *)s;
+ (int) intValueForHexChar:(char) c;
/*
 * Cree un tableau de type NSArray a partir d'un
 * tableau de chaines de caracteres
 */
+ (NSArray*) creerTableauString:(char**) tabString
                ayantPourTaille:(int) taille;

@end


@implementation WebserviceUtils

struct soap *soap = NULL;

+ (void)initSoap {
    if (soap == NULL) {
        soap = (struct soap *) malloc(sizeof(struct soap));
        soap_init(soap);
        if (FAC == 1) {
            soap->proxy_host = "proxy-web.univ-fcomte.fr";
            soap->proxy_port = 3128;
        }
    }
}

+ (int) addLigneStationBornePerso:(NSString*) Idenditifiant
                                 :(NSString*) MotDePasseMD5
                                 :(NSString*) nomStation
                                 :(NSString*) ligne
                                 :(NSString*) sens
{
    
    if (soap == NULL) {
        // Initialisation de gsoap
        [WebserviceUtils initSoap];
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__addLigneStationBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    requete.nomStation = (char*) [nomStation UTF8String];
    requete.ligne = (char*) [ligne UTF8String];
    requete.sens = (char*) [sens UTF8String];
    
	struct _ns1__addLigneStationBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__addLigneStationBornePerso(soap, ADRESSEWS, NULL,
                                                    &requete, &reponse)) {
        
        return reponse.addLigneStationBornePersoReturn;
	}
	
	NSLog(@"Erreur: Appel SOAP: addLigneStationBornePerso");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (int) createBornePerso:(NSString*) Idenditifiant
                        :(NSString*) MotDePasseMD5
{
    
    if (soap == NULL) {
        // Initialisation de gsoap
        [WebserviceUtils initSoap];
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__createBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    
	struct _ns1__createBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__createBornePerso(soap, ADRESSEWS, NULL,
                                           &requete, &reponse)) {
        
        return reponse.createBornePersoReturn;
	}
	
	NSLog(@"Erreur: Appel SOAP: createBornePerso");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (int) deleteLigneStationBornePerso:(NSString*) Idenditifiant
                                    :(NSString*) MotDePasseMD5
                                    :(NSString*) nomStation
                                    :(NSString*) ligne
                                    :(NSString*) sens
{
    
    if (soap == NULL) {
        // Initialisation de gsoap
        [WebserviceUtils initSoap];
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__deleteLigneStationBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    requete.nomStation = (char*) [nomStation UTF8String];
    requete.ligne = (char*) [ligne UTF8String];
    requete.sens = (char*) [sens UTF8String];
    
	struct _ns1__deleteLigneStationBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__deleteLigneStationBornePerso(soap, ADRESSEWS, NULL,
                                                       &requete, &reponse)) {
        
        return reponse.deleteLigneStationBornePersoReturn;
	}
	NSLog(@"Erreur: Appel SOAP: deleteLigneStationBornePerso");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getInfoTrafic {
    
    NSMutableArray *listeInfosTrafic; // Tableau d'infos trafic
    int nbObjInfoTrafic; // Nombre d'objet a creer
    int nL, nC; // Nombre de ligne, Nombre de colonne d'une matrice
    
    // Variable temporaire pour la creation des Lignes
    InfoTrafic *iT;
    
	if (soap == NULL) {
        // Initialisation de gsoap
        [WebserviceUtils initSoap];
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getInfoTrafic requete;
	struct _ns1__getInfoTraficResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getInfoTrafic(soap, ADRESSEWS, NULL,
                                        &requete, &reponse)) {
        nC = atoi(reponse.getInfoTraficReturn[0]);
        
        nL = atoi(reponse.getInfoTraficReturn[1]);
        
        nbObjInfoTrafic = nL;
        listeInfosTrafic = [NSMutableArray arrayWithCapacity:nbObjInfoTrafic];
        
        for (int i=2; i < nbObjInfoTrafic+2; i++) {
            
            iT = [[InfoTrafic alloc] initWithTitle:[NSString stringWithCString:reponse.getInfoTraficReturn[i] encoding:NSASCIIStringEncoding]
                                            withId:[NSString stringWithCString:reponse.getInfoTraficReturn[i+nbObjInfoTrafic * 4] encoding:NSASCIIStringEncoding]
                                          withBody:[NSString stringWithCString:reponse.getInfoTraficReturn[i+nbObjInfoTrafic * 3] encoding:NSASCIIStringEncoding]
                                          withLink:[NSURL URLWithString:[NSString stringWithCString:reponse.getInfoTraficReturn[i+nbObjInfoTrafic * 2] encoding:NSASCIIStringEncoding]]
                                      withPriority:(reponse.getInfoTraficReturn[i+nbObjInfoTrafic][0] == '1') ? YES : NO];
            
            [listeInfosTrafic addObject:iT];
            [iT release];
        }
        
        return listeInfosTrafic;
    }
	
	NSLog(@"Erreur: Appel SOAP: getInfoTrafic");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getLigneStationBornePerso:(NSString*) Idenditifiant
                                      :(NSString*) MotDePasseMD5
{
    
    if (soap == NULL) {
        // Initialisation de gsoap
        [WebserviceUtils initSoap];
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getLigneStationBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    
	struct _ns1__getLigneStationBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getLigneStationBornePerso(soap, ADRESSEWS, NULL,
                                                    &requete, &reponse)) {
        
        /*return [WebserviceUtils creerTableau2DString:
                reponse.getLigneStationBornePersoReturn];*/
	}
	
	NSLog(@"Erreur: Appel SOAP: getLigneStationBornePerso");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getListeLignes {
    
    NSMutableArray *listeLignes; // Tableau de Lignes de bus
    int nbObjLignes; // Nombre d'objet a creer
    int nL, nC; // Nombre de ligne, Nombre de colonne d'une matrice
    
    // Variable temporaire pour la creation des Lignes
    Ligne *l;
    NSString *couleurs;
    NSArray *tabCouleurs;
    
    if (soap == NULL) {
        // Initialisation de gsoap
        [WebserviceUtils initSoap];
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getListeLignes requete;
	struct _ns1__getListeLignesResponse reponse;
	
	//Appel du service web
	if (!soap_call___ns1__getListeLignes(soap, ADRESSEWS, NULL,
                                         &requete, &reponse)) {
        
        nC = atoi(reponse.getListeLignesReturn[0]);
        //printf("Colonnes %d\n", nC);
        
        nL = atoi(reponse.getListeLignesReturn[1]);
        //printf("Lignes %d\n", nL);
        
        nbObjLignes = nL;
        listeLignes = [NSMutableArray arrayWithCapacity:nbObjLignes];
        
        for (int i=2; i < nbObjLignes+2; i++) {
            
            couleurs = [NSString stringWithCString:reponse.getListeLignesReturn[i+nbObjLignes * 3] encoding:NSASCIIStringEncoding];
            
            tabCouleurs = [couleurs componentsSeparatedByString:@"-"];
            
            l = [[Ligne alloc] initWithIdent:[NSNumber numberWithInt: i-2]
                              initWithNumero:[NSString stringWithCString:reponse.getListeLignesReturn[i] encoding:NSASCIIStringEncoding]
                                    withSens:[NSString stringWithCString:reponse.getListeLignesReturn[i+nbObjLignes] encoding:NSASCIIStringEncoding]
                               withDirection:[NSString stringWithCString:reponse.getListeLignesReturn[i+nbObjLignes * 2] encoding:NSASCIIStringEncoding]
                              withColorLabel:[self uiColorWithHexString:[tabCouleurs objectAtIndex:0]] 
                         withColorBackground:[self uiColorWithHexString:[tabCouleurs objectAtIndex:1]]];
            
            
            [listeLignes addObject:l];
            [l release];
        }
        
        return listeLignes;
    }
    
	NSLog(@"Erreur: Appel SOAP: getListeLignes");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getListeStations {
	
	if (soap == NULL) {
        // Initialisation de gsoap
        [WebserviceUtils initSoap];
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getListeStations requete;
	struct _ns1__getListeStationsResponse reponse;
	
	//Appel du service web
	if (!soap_call___ns1__getListeStations(soap, ADRESSEWS, NULL,
                                           &requete, &reponse)) {
        
		return [WebserviceUtils creerTableauString:reponse.getListeStationsReturn
                                   ayantPourTaille:reponse.__sizegetListeStationsReturn];
	}
	
	NSLog(@"Erreur: Appel SOAP: getListeStations");
    
    // Si la requete echoue on test nil
	return nil;
}

+ (NSArray*) getListeStationsParLigne:(NSString*) ligne
                                     :(NSString*) sens
{
    
    
    //printf("getListeStationsParLigne %s, %s", [ligne cString], [sens cSting]);
    
	if (soap == NULL) {
        // Initialisation de gsoap
        [WebserviceUtils initSoap];
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getListeStationsParLigne requete;
    requete.ligne = (char*) [ligne UTF8String];
    requete.sens = (char*) [sens UTF8String];
    
	struct _ns1__getListeStationsParLigneResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getListeStationsParLigne(soap, ADRESSEWS, NULL,
                                                   &requete, &reponse)) {
        
        return [WebserviceUtils
                creerTableauString:reponse.getListeStationsParLigneReturn
                ayantPourTaille:reponse.__sizegetListeStationsParLigneReturn];
	}
	
	NSLog(@"Erreur: Appel SOAP: getListeStationsParLigne");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getMessages:(NSString*) listeIdMessage {
    
    if (soap == NULL) {
        // Initialisation de gsoap
        [WebserviceUtils initSoap];
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getMessages requete;
    requete.listeIdMessage = (char*) [listeIdMessage UTF8String];
    
	struct _ns1__getMessagesResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getMessages(soap, ADRESSEWS, NULL, &requete, &reponse)) {
        
        /*return [WebserviceUtils creerTableau2DString:reponse.getMessagesReturn];*/
	}
    
    NSLog(@"Erreur: Appel SOAP: getMessages");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getListeStationsProches:(NSString*) longitute
                                    :(NSString*) latitude
                                    :(float) precision
{
    /*
     if (soap == NULL) {
     // Initialisation de gsoap
     [WebserviceUtils initSoap];
     }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getStationsLesPlusProches requete;
    requete.Longitute = (char*) [Longitute UTF8String];
    requete.Latitude = (char*) [Latitude UTF8String];
    
	struct _ns1__getStationsLesPlusProchesResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getStationsLesPlusProches(soap, ADRESSEWS, NULL,
                                                    &requete, &reponse)) {
        
        return [WebserviceUtils 
                creerTableauString:reponse.getStationsLesPlusProchesReturn
                ayantPourTaille:reponse.__sizegetStationsLesPlusProchesReturn];
	}
	
	NSLog(@"Erreur: Appel SOAP: getStationsLesPlusProches");
    */ 
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getTempsParStation:(NSString*) nomStation {
    
    NSMutableArray *listeTemps; // Tableau de Lignes de bus
    int nbObjLignes; // Nombre d'objet a creer
    int nL, nC; // Nombre de ligne, Nombre de colonne d'une matrice
    
    NSString *couleurs;
    NSArray *tabCouleurs;
    
    NSString *dir, *dir1, *dir2;
    
    
    TempsAttentes *l;
    Ligne *ligne;
    
    if (soap == NULL) {
        // Initialisation de gsoap
        [WebserviceUtils initSoap];
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getTempsParStation requete;
    requete.nomStation = (char*) [nomStation UTF8String];
    
	struct _ns1__getTempsParStationResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getTempsParStation(soap, ADRESSEWS, NULL,
                                             &requete, &reponse)) {
        
        nC = atoi(reponse.getTempsParStationReturn[0]);
        //printf("Colonnes %d\n", nC);
        
        nL = atoi(reponse.getTempsParStationReturn[1]);
        //printf("Lignes %d\n", nL);
        
        nbObjLignes = nL;
        listeTemps = [NSMutableArray arrayWithCapacity:nbObjLignes];
        
        
        for (int i=2; i < nbObjLignes+2; i++) {
            
            couleurs = [NSString stringWithCString:reponse.getTempsParStationReturn[i+nbObjLignes * 10] encoding:NSASCIIStringEncoding];
            
            tabCouleurs = [couleurs componentsSeparatedByString:@"-"];
            
            dir1 = [NSString stringWithCString:reponse.getTempsParStationReturn[i+nbObjLignes * 4] encoding:NSASCIIStringEncoding];
            dir2 = [NSString stringWithCString:reponse.getTempsParStationReturn[i+nbObjLignes * 5] encoding:NSASCIIStringEncoding];
            dir = dir1;
            
            ligne = [[Ligne alloc] initWithIdent:[NSNumber numberWithInt: i-2] 
                                  initWithNumero:[NSString stringWithCString:reponse.getTempsParStationReturn[i] encoding:NSASCIIStringEncoding] 
                                        withSens:[NSString stringWithCString:reponse.getTempsParStationReturn[i+nbObjLignes * 1] encoding:NSASCIIStringEncoding] 
                                   withDirection:dir 
                                  withColorLabel:[self uiColorWithHexString:[tabCouleurs objectAtIndex:0]] 
                             withColorBackground:[self uiColorWithHexString:[tabCouleurs objectAtIndex:1]]]; 
            
            l = [[TempsAttentes alloc] initWithIdent:[NSNumber numberWithInt: i-2]
                                           withLigne:ligne 
                                      withDirection1:dir1
                                      withDirection2:dir2
                                        withHoraire1:[NSString stringWithCString:reponse.getTempsParStationReturn[i+nbObjLignes * 2] encoding:NSASCIIStringEncoding] 
                                        withHoraire2:[NSString stringWithCString:reponse.getTempsParStationReturn[i+nbObjLignes * 3] encoding:NSASCIIStringEncoding] 
                                           withInfo1:[NSString stringWithCString:reponse.getTempsParStationReturn[i+nbObjLignes * 6] encoding:NSASCIIStringEncoding] 
                                           withInfo2:[NSString stringWithCString:reponse.getTempsParStationReturn[i+nbObjLignes * 7] encoding:NSASCIIStringEncoding] 
                                        withMessages:NULL];
            
            [listeTemps addObject:l];
            [ligne release];
            [l release];
        }
        
        return listeTemps;
    }
	
	NSLog(@"Erreur: Appel SOAP: getTempsParStation");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (int) verifBornePerso:(NSString*) Idenditifiant
                       :(NSString*) MotDePasseMD5
{
    
    if (soap == NULL) {
        // Initialisation de gsoap
        [WebserviceUtils initSoap];
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__verifBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    
	struct _ns1__verifBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__verifBornePerso(soap, ADRESSEWS, NULL,
                                          &requete, &reponse)) {
        
        return reponse.verifBornePersoReturn;
    }
	
	NSLog(@"Erreur: Appel SOAP: verifBornePerso");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) creerTableauString:(char**) tabString
                ayantPourTaille:(int) taille
{
    
    NSMutableArray *tableauRetour = [NSMutableArray arrayWithCapacity:taille];
    NSString *tmp;
    
    for (int i = 0; i < taille; i++) {
        tmp = [NSString stringWithCString:tabString[i]
                                 encoding:NSASCIIStringEncoding];
        if (tmp != nil) { // Une insertion nil fait planter l'appli
            [tableauRetour addObject:tmp];
        }
    }
    
    return tableauRetour;
}

+ (UIColor *) uiColorWithHexString:(NSString *) s {
    
    CGFloat r = (CGFloat) ([self intValueForHexChar:[s characterAtIndex:0]] * 16 +
                           [self intValueForHexChar:[s characterAtIndex:1]]) / 255.0f,
    
    g = (CGFloat) ([self intValueForHexChar:[s characterAtIndex:2]] * 16 +
                   [self intValueForHexChar:[s characterAtIndex:3]]) / 255.0f,
    
    b = (CGFloat) ([self intValueForHexChar:[s characterAtIndex:4]] * 16 +
                   [self intValueForHexChar:[s characterAtIndex:5]]) / 255.0f;
    
    //printf("r : %f\ng : %f\nb : %f\n", r,g,b);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
}

+ (int) intValueForHexChar:(char) c {
    switch (c) {
        case '0': return 0;
        case '1': return 1;
        case '2': return 2;
        case '3': return 3;
        case '4': return 4;
        case '5': return 5;
        case '6': return 6;
        case '7': return 7;
        case '8': return 8;
        case '9': return 9;
        case 'a':
        case 'A': return 10;
        case 'b':
        case 'B': return 11;
        case 'c':
        case 'C': return 12;
        case 'd':
        case 'D': return 13;
        case 'e':
        case 'E': return 14;
        case 'f':
        case 'F': return 15;
        default: return nil;
    }
}

@end
