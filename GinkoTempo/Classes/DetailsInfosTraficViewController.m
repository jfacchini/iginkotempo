//
//  DetailsInfosTraficViewController.m
//  GinkoTempo
//
//  Created by Jocelyn FACCHINI on 11/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailsInfosTraficViewController.h"


@implementation DetailsInfosTraficViewController

@synthesize detailsInfosTraficView;
@synthesize titreInfoTrafic;
@synthesize corpsInfoTrafic;
@synthesize uneInfoTrafic;

- (id)initWithInfoTrafic:(InfoTrafic *)myInfoTrafic {
    
    if([self init]) {
        self.title = @"Information";
        
        self.detailsInfosTraficView = nil;
        self.titreInfoTrafic = nil;
        self.corpsInfoTrafic = nil;
        self.uneInfoTrafic = myInfoTrafic;
    }
    
    return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    
    CGSize tailleMax = CGSizeMake(310, 9999);
    CGSize tailleRect = [uneInfoTrafic.titre sizeWithFont:[UIFont boldSystemFontOfSize:18] constrainedToSize:tailleMax];
    
    titreInfoTrafic = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 310, tailleRect.height)];
    
    titreInfoTrafic.text = uneInfoTrafic.titre;
    titreInfoTrafic.numberOfLines = tailleRect.height / 18;
    titreInfoTrafic.font = [UIFont boldSystemFontOfSize:18];
    
    [titreInfoTrafic setTextAlignment:UITextAlignmentCenter];
    
    CGFloat nouveauY = tailleRect.height + 15;
    tailleRect = [uneInfoTrafic.corps sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:tailleMax];
    
    corpsInfoTrafic = [[UILabel alloc] initWithFrame:CGRectMake(5, nouveauY, 310, tailleRect.height)];
    corpsInfoTrafic.text = uneInfoTrafic.corps;
    corpsInfoTrafic.numberOfLines = tailleRect.height / 16;
    corpsInfoTrafic.font = [UIFont systemFontOfSize:16];
    
    nouveauY += tailleRect.height + 20;
    
    UILabel *plusDinfo = [[UILabel alloc] initWithFrame:CGRectMake(5, nouveauY, 310, 14)];
    plusDinfo.text = @"Information détaillée sur Ginkobus.com";
    plusDinfo.font = [UIFont systemFontOfSize:14];
    plusDinfo.textColor = [UIColor blueColor];
    
    detailsInfosTraficView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    [detailsInfosTraficView addSubview:titreInfoTrafic];
    [detailsInfosTraficView addSubview:corpsInfoTrafic];
    [detailsInfosTraficView addSubview:plusDinfo];
    [detailsInfosTraficView setScrollEnabled:YES];
    
    [plusDinfo release];
    
    self.view = detailsInfosTraficView;
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [detailsInfosTraficView release];
    [titreInfoTrafic release];
    [corpsInfoTrafic release];
    [uneInfoTrafic release];
    [super dealloc];
}


@end
