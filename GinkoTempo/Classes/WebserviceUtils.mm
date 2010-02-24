//
//  WebserviceUtils.m
//  tempoGSoap
//
//  Created by Jocelyn FACCHINI on 28/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WebserviceUtils.h"
#import "TempoApiSoapBinding.nsmap"

@implementation WebserviceUtils{
	
}

+ (int) addLigneStationBornePerso:(NSString*) Idenditifiant
                                 :(NSString*) MotDePasseMD5
                                 :(NSString*) nomStation
                                 :(NSString*) ligne
                                 :(NSString*) sens
{
 
    // Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
	
	// Creation des objet Requete/Reponse
	struct _ns1__addLigneStationBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    requete.nomStation = (char*) [nomStation UTF8String];
    requete.ligne = (char*) [ligne UTF8String];
    requete.sens = (char*) [sens UTF8String];
    
	struct _ns1__addLigneStationBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__addLigneStationBornePerso(&soap, NULL, NULL,
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
	
	// Creation des objet Requete/Reponse
	struct _ns1__createBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    
	struct _ns1__createBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__createBornePerso(&soap, NULL, NULL,
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
	
	// Creation des objet Requete/Reponse
	struct _ns1__deleteLigneStationBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    requete.nomStation = (char*) [nomStation UTF8String];
    requete.ligne = (char*) [ligne UTF8String];
    requete.sens = (char*) [sens UTF8String];
    
	struct _ns1__deleteLigneStationBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__deleteLigneStationBornePerso(&soap, NULL, NULL,
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
	soap_init(&soap);
	
	// Creation des objet Requete/Reponse
	struct _ns1__getInfoTrafic requete;
	struct _ns1__getInfoTraficResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getInfoTrafic(&soap, NULL, NULL,
                                        &requete, &reponse)) {
        
        return [WebserviceUtils creerTableau2DString:reponse.getInfoTraficReturn];
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
	
	// Creation des objet Requete/Reponse
	struct _ns1__getLigneStationBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    
	struct _ns1__getLigneStationBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getLigneStationBornePerso(&soap, NULL, NULL,
                                                    &requete, &reponse)) {
        
        return [WebserviceUtils creerTableau2DString:
                reponse.getLigneStationBornePersoReturn];
	}
	
	NSLog(@"Erreur: Appel SOAP: getLigneStationBornePerso");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getListeLignes {
    
    // Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
	
	// Creation des objet Requete/Reponse
	struct _ns1__getListeLignes requete;
	struct _ns1__getListeLignesResponse reponse;
	
	//Appel du service web
	if (!soap_call___ns1__getListeLignes(&soap, NULL, NULL,
                                         &requete, &reponse)) {
        
        return [WebserviceUtils creerTableau2DString:reponse.getListeLignesReturn];
	}
	
	NSLog(@"Erreur: Appel SOAP: getListeLignes");
    
    // Si la requete echoue on test nil
    return nil;
}

+ (NSArray*) getListeStations {
	
	// Initialisation de gsoap
	struct soap soap;
	soap_init(&soap);
	
	// Creation des objet Requete/Reponse
	struct _ns1__getListeStations requete;
	struct _ns1__getListeStationsResponse reponse;
	
	//Appel du service web
	if (!soap_call___ns1__getListeStations(&soap, NULL, NULL,
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
	
	// Creation des objet Requete/Reponse
	struct _ns1__getListeStationsParLigne requete;
    requete.ligne = (char*) [ligne UTF8String];
    requete.sens = (char*) [sens UTF8String];
    
	struct _ns1__getListeStationsParLigneResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getListeStationsParLigne(&soap, NULL, NULL,
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
	
	// Creation des objet Requete/Reponse
	struct _ns1__getMessages requete;
    requete.listeIdMessage = (char*) [listeIdMessage UTF8String];
    
	struct _ns1__getMessagesResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getMessages(&soap, NULL, NULL, &requete, &reponse)) {
        
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
	
	// Creation des objet Requete/Reponse
	struct _ns1__getStationsLesPlusProches requete;
    requete.Longitute = (char*) [Longitute UTF8String];
    requete.Latitude = (char*) [Latitude UTF8String];
    
	struct _ns1__getStationsLesPlusProchesResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getStationsLesPlusProches(&soap, NULL, NULL,
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
	
	// Creation des objet Requete/Reponse
	struct _ns1__getTempsParStation requete;
    requete.nomStation = (char*) [nomStation UTF8String];
    
	struct _ns1__getTempsParStationResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__getTempsParStation(&soap, NULL, NULL,
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
	
	// Creation des objet Requete/Reponse
	struct _ns1__verifBornePerso requete;
    requete.Idenditifiant = (char*) [Idenditifiant UTF8String];
    requete.MotDePasseMD5 = (char*) [MotDePasseMD5 UTF8String];
    
	struct _ns1__verifBornePersoResponse reponse;
    
    //Appel du service web
	if (!soap_call___ns1__verifBornePerso(&soap, NULL, NULL,
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

@end
