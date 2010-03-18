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
@synthesize uneInfoTrafic;

- (id)initWithInfoTrafic:(InfoTrafic *)myInfoTrafic {
    
    if([self init]) {
        self.detailsInfosTraficView = nil;
        self.titreInfoTrafic = nil;
        self.uneInfoTrafic = myInfoTrafic;
    }
    
    return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    
    titreInfoTrafic = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 310, 50)];
    
    titreInfoTrafic.text = uneInfoTrafic.titre;
    titreInfoTrafic.numberOfLines = 2;
    titreInfoTrafic.font = [UIFont boldSystemFontOfSize:18];
    titreInfoTrafic.adjustsFontSizeToFitWidth = YES;
    titreInfoTrafic.minimumFontSize = 10;
    
    [titreInfoTrafic setTextAlignment:UITextAlignmentCenter];
    
    corpsInfoTrafic = [[UITextView alloc] initWithFrame:CGRectMake(5, 65, 310, 302)];
    corpsInfoTrafic.text = [NSString stringWithFormat:@"%@\n\n%@", uneInfoTrafic.corps, uneInfoTrafic.lienSurGinkobus];
    corpsInfoTrafic.font = [UIFont systemFontOfSize:16];
    corpsInfoTrafic.dataDetectorTypes = UIDataDetectorTypeAll;
    [corpsInfoTrafic setScrollEnabled:YES];
    [corpsInfoTrafic setEditable:NO];
    
    detailsInfosTraficView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    [detailsInfosTraficView addSubview:titreInfoTrafic];
    [detailsInfosTraficView addSubview:corpsInfoTrafic];
    
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
    //[titreInfoTrafic release];
    [uneInfoTrafic release];
    [super dealloc];
}


@end
