//
//  WebserviceUtils.m
//  tempoGSoap
//
//  Created by Jocelyn FACCHINI on 28/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WebserviceUtils.h"
#import "Ligne.h"
#import "InfoTrafic.h"
#import "TempoApiSoapBinding.nsmap"

#define FAC 0

@interface WebserviceUtils(mymethods)

+ (UIColor *) uiColorWithHexString:(NSString *)s;
+ (int) intValueForHexChar:(char) c;

@end



@implementation WebserviceUtils

+ (int) addLigneStationBornePerso:(NSString*) Idenditifiant
                                 :(NSString*) MotDePasseMD5
                                 :(NSString*) nomStation
                                 :(NSString*) ligne
                                 :(NSString*) sens
{
 
    // Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
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
	if (!soap_call___ns1__addLigneStationBornePerso(&soap, ADRESSEWS, NULL,
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
    
    // Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__createBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    
	struct _ns1__createBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__createBornePerso(&soap, ADRESSEWS, NULL,
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
 
    // Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
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
	if (!soap_call___ns1__deleteLigneStationBornePerso(&soap, ADRESSEWS, NULL,
                                                       &requete, &reponse)) {
        
        return reponse.deleteLigneStationBornePersoReturn;
	}
	NSLog(@"Erreur: Appel SOAP: deleteLigneStationBornePerso");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getInfoTrafic {
    
    // Initialisation de gsoap
	struct soap soap;
    NSMutableArray *listeInfosTrafic; // Tableau d'infos trafic
    int nbObjInfoTrafic; // Nombre d'objet a creer
    int nL, nC; // Nombre de ligne, Nombre de colonne d'une matrice
    
    // Variable temporaire pour la creation des Lignes
    InfoTrafic *iT;
    
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getInfoTrafic requete;
	struct _ns1__getInfoTraficResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getInfoTrafic(&soap, ADRESSEWS, NULL,
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
    
    // Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getLigneStationBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    
	struct _ns1__getLigneStationBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getLigneStationBornePerso(&soap, ADRESSEWS, NULL,
                                                    &requete, &reponse)) {
        
        return [WebserviceUtils creerTableau2DString:
                reponse.getLigneStationBornePersoReturn];
	}
	
	NSLog(@"Erreur: Appel SOAP: getLigneStationBornePerso");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getListeLignes {
    
	struct soap soap;
    NSMutableArray *listeLignes; // Tableau de Lignes de bus
    int nbObjLignes; // Nombre d'objet a creer
    int nL, nC; // Nombre de ligne, Nombre de colonne d'une matrice
    
    // Variable temporaire pour la creation des Lignes
    Ligne *l;
    NSString *couleurs;
    NSArray *tabCouleurs;
    
    // Initialisation de gsoap
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getListeLignes requete;
	struct _ns1__getListeLignesResponse reponse;
	
	//Appel du service web
	if (!soap_call___ns1__getListeLignes(&soap, ADRESSEWS, NULL,
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
            

//            l = [[Ligne alloc] initWithIdent:[NSNumber numberWithInt: i-2]
//                              initWithNumero:[NSString stringWithCString:reponse.getListeLignesReturn[i] encoding:NSASCIIStringEncoding]
//                                    withSens:[NSString stringWithCString:reponse.getListeLignesReturn[i+nbObjLignes] encoding:NSASCIIStringEncoding]
//                               withDirection:[NSString stringWithCString:reponse.getListeLignesReturn[i+nbObjLignes * 2] encoding:NSASCIIStringEncoding]
//                              withColorLabel:[UIColor blackColor]
//                         withColorBackground:[UIColor whiteColor]];
            
            [listeLignes addObject:l];
            [l release];
            //[couleurs release];
            //[tabCouleurs release];
        }
        
        return listeLignes;
    }
	
	NSLog(@"Erreur: Appel SOAP: getListeLignes");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getListeStations {
	
	// Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getListeStations requete;
	struct _ns1__getListeStationsResponse reponse;
	
	//Appel du service web
	if (!soap_call___ns1__getListeStations(&soap, ADRESSEWS, NULL,
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
    // Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getListeStationsParLigne requete;
    requete.ligne = (char*) [ligne UTF8String];
    requete.sens = (char*) [sens UTF8String];
    
	struct _ns1__getListeStationsParLigneResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getListeStationsParLigne(&soap, ADRESSEWS, NULL,
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
    
    // Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getMessages requete;
    requete.listeIdMessage = (char*) [listeIdMessage UTF8String];
    
	struct _ns1__getMessagesResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getMessages(&soap, ADRESSEWS, NULL, &requete, &reponse)) {
        
        return [WebserviceUtils creerTableau2DString:reponse.getMessagesReturn];
	}
    
    NSLog(@"Erreur: Appel SOAP: getMessages");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getStationsLesPlusProches:(NSString*) Longitute
                                       :(NSString*)Latitude
{
    
    // Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getStationsLesPlusProches requete;
    requete.Longitute = (char*) [Longitute UTF8String];
    requete.Latitude = (char*) [Latitude UTF8String];
    
	struct _ns1__getStationsLesPlusProchesResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getStationsLesPlusProches(&soap, ADRESSEWS, NULL,
                                                    &requete, &reponse)) {
    
        return [WebserviceUtils 
                creerTableauString:reponse.getStationsLesPlusProchesReturn
                ayantPourTaille:reponse.__sizegetStationsLesPlusProchesReturn];
	}
	
	NSLog(@"Erreur: Appel SOAP: getStationsLesPlusProches");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getTempsParStation:(NSString*) nomStation {
    
    // Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__getTempsParStation requete;
    requete.nomStation = (char*) [nomStation UTF8String];
    
	struct _ns1__getTempsParStationResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getTempsParStation(&soap, ADRESSEWS, NULL,
                                             &requete, &reponse)) {
        
        return [WebserviceUtils creerTableau2DString:reponse.getTempsParStationReturn];
    }
	
	NSLog(@"Erreur: Appel SOAP: getTempsParStation");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (int) verifBornePerso:(NSString*) Idenditifiant
                       :(NSString*) MotDePasseMD5
{
    
    // Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
    if (FAC == 1) {
        soap.proxy_host = "proxy-web.univ-fcomte.fr";
        soap.proxy_port = 3128;
    }
	
	// Creation des objet Requete/Reponse
	struct _ns1__verifBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    
	struct _ns1__verifBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__verifBornePerso(&soap, ADRESSEWS, NULL,
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

+ (NSArray*) creerTableau2DString:(char**) tabString {
    
    int nColonnes, nLignes,
        debutColonne = 2;
    NSMutableArray *tableauRetour = [NSMutableArray arrayWithCapacity:nColonnes];
    NSMutableArray *tableauLignes;
    NSString *tmp;
    
    nColonnes = atoi(tabString[0]);
    printf("Colonnes %d\n", nColonnes);
    
    nLignes = atoi(tabString[1]);
    printf("Lignes %d\n", nLignes);
    
    for (int i=0; i<nColonnes; i++) {
        
        tableauLignes = [NSMutableArray arrayWithCapacity:nLignes];
        
        for (int j=0; j<nLignes; j++) {
            tmp = [NSString stringWithCString:tabString[debutColonne+j]
                                     encoding:NSASCIIStringEncoding];

            if (tmp != nil) { // Une insertion de nil fait planter l'appli
                [tableauLignes addObject:tmp];
            }
        }
        [tableauRetour addObject:tableauLignes];
        debutColonne += nLignes;
    }
    
    return tableauRetour;
}

+ (void) afficheTableau:(NSArray*)tab {
    
    id elt;
    NSEnumerator *itElt = [tab objectEnumerator];

    printf("=== Debut tableau ===\n");
    
    while ((elt = [itElt nextObject])) {
        
        printf("==> %s\n", [elt UTF8String]);
    }
    
    printf("=== Fin tableau ===\n");
}

+ (void) afficheTableau2D:(NSArray*)tab {
    
    int i=0;
    id tabCol, tabLigne;
    NSEnumerator *itCol = [tab objectEnumerator], *itLigne;
    
    printf("---- Debut tableau ----\n");
    
    while ((tabCol = [itCol nextObject])) {
        
        printf("  -- Colonne %d --\n", i);
        i++;
        
        itLigne = [tabCol objectEnumerator];
        while ((tabLigne = [itLigne nextObject])) {
            
            printf("==> %s\n", [tabLigne UTF8String]);
        }
    }
    printf("---- Fin tableau ----\n");
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
