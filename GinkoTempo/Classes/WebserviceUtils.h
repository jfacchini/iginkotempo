//
//  WebserviceUtils.h
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 28/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ADRESSEWS NULL

// V 0.6 du Webservice

@interface WebserviceUtils : NSObject {}

/*
 * Appel fonction addLigneStationBornePerso sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (int) addLigneStationBornePerso:(NSString*) Idenditifiant
                                 :(NSString*) MotDePasseMD5
                                 :(NSString*) nomStation
                                 :(NSString*) ligne
                                 :(NSString*) sens;
/*
 * Appel fonction createBornePerso sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (int) createBornePerso:(NSString*) Idenditifiant
                        :(NSString*) MotDePasseMD5;
/*
 * Appel fonction deleteLigneStationBornePerso sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (int) deleteLigneStationBornePerso:(NSString*) Idenditifiant
                                    :(NSString*) MotDePasseMD5
                                    :(NSString*) nomStation
                                    :(NSString*) ligne
                                    :(NSString*) sens;
/*
 * Appel fonction getInfoTrafic sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (NSArray*) getInfoTrafic;
/*
 * Appel fonction getLigneStationBornePerso sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (NSArray*) getLigneStationBornePerso:(NSString*) Idenditifiant
                                       :(NSString*) MotDePasseMD5;
/*
 * Appel fonction getListeLignes sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (NSArray*) getListeLignes;
/*
 * Appel fonction getListeStations sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (NSArray*) getListeStations;
/*
 * Appel fonction getListeStationsParLigne sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (NSArray*) getListeStationsParLigne:(NSString*) ligne
                                      :(NSString*) sens;
/*
 * Appel fonction getMessages sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (NSArray*) getMessages:(NSString*) listeIdMessage;
/*
 * Appel fonction getStationsLesPlusProches sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (NSArray*) getStationsLesPlusProches:(NSString*) longitute
                                       :(NSString*) latitude;
/*
 * Appel fonction getTempsParStation sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (NSArray*) getTempsParStation:(NSString*) nomStation;
/*
 * Appel fonction verifBornePerso sur le Webservice de Ginkotempo.
 * Voir l'API Ginkotempo pour plus d'information sur la fonction.
 */
+ (int) verifBornePerso:(NSString*) idenditifiant
                       :(NSString*) motDePasseMD5;
/*
 * Cree un tableau de type NSArray a partir d'un
 * tableau de chaines de caracteres
 */
+ (NSArray*) creerTableauString:(char**) tabString
                ayantPourTaille:(int) taille;
/*
 * Transforme un tableau de chaines de caracteres
 * d'une dimension en un tableau a deux dimensions
 *
 * Return : Retourne un objet NSArray contenant des objets
 *          NSArray eux-memes contenant des objets NSString
 */
+ (NSArray*) creerTableau2DString:(char**) tabString;

+ (void) afficheTableau:(NSArray*)tab;

+ (void) afficheTableau2D:(NSArray*)tab;

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;

@end
