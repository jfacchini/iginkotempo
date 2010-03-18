//
//  DetailsInfosTraficViewController.h
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 11/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoTrafic.h"


@interface DetailsInfosTraficViewController : UIViewController {
    
    UIScrollView *detailsInfosTraficView;
    UILabel *titreInfoTrafic;
    UILabel *corpsInfoTrafic;
    
    InfoTrafic *uneInfoTrafic;

}

@property (nonatomic,retain) UIScrollView *detailsInfosTraficView;
@property (nonatomic,retain) UILabel *titreInfoTrafic;
@property (nonatomic,retain) UILabel *corpsInfoTrafic;
@property (nonatomic,retain) InfoTrafic *uneInfoTrafic;

- (id)initWithInfoTrafic:(InfoTrafic *)myInfoTrafic;

@end
