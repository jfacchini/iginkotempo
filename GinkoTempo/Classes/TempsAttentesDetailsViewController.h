//
//  TempsAttentesDetails.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TempsAttentes.h"

@interface TempsAttentesDetailsViewController : UIViewController {
    
    UIView *viewGlobale;
    
    UILabel *ligne1;
    UILabel *ligne2;
    
    TempsAttentes *tempsAttente;
    
    UIButton *addremove;
}

@property (nonatomic,retain) UIView *viewGlobale;
@property (nonatomic,retain) UILabel *ligne1;
@property (nonatomic,retain) UILabel *ligne2;
@property (nonatomic,retain) TempsAttentes *tempsAttente;
@property (nonatomic,retain) UIButton *addremove;

- (id)initWithTempsAttentes:(TempsAttentes *)myTempsAttente;

@end


