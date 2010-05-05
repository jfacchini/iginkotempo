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
    
    UIScrollView *globaleView;
    
    UILabel *label;
    TempsAttentes *tempsAttente;

    UILabel *titleMessage;
    UILabel *titleBus1;
    UILabel *titleBus2;

    UILabel *message;
    UILabel *infoBus1;
    UILabel *infoBus2;
    
    UIButton *button;
}

@property (nonatomic,retain) UIView *globaleView;
@property (nonatomic,retain) UILabel *label;
@property (nonatomic,retain) TempsAttentes *tempsAttente;

@property (nonatomic,retain) UILabel *titleMessage;
@property (nonatomic,retain) UILabel *titleBus1;
@property (nonatomic,retain) UILabel *titleBus2;
@property (nonatomic,retain) UILabel *message;
@property (nonatomic,retain) UILabel *infoBus1;
@property (nonatomic,retain) UILabel *infoBus2;

@property (nonatomic,retain) UIButton *button;

-(id)initWithTempsAttentes:(TempsAttentes *)myTempsAttente inBornePerso:(Boolean *)isBornePerso;

@end


