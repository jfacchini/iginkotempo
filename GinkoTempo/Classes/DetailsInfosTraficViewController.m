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

@synthesize uneInfoTrafic;

- (id)initWithInfoTrafic:(InfoTrafic *)myInfoTrafic {
    
    if([self init]) {
        self.detailsInfosTraficView = nil;
        self.uneInfoTrafic = myInfoTrafic;
    }
    
    return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    
    self.detailsInfosTraficView = [[UITextView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.detailsInfosTraficView.text = self.uneInfoTrafic.corps;
    self.detailsInfosTraficView.font = [UIFont systemFontOfSize:18];
    [self.detailsInfosTraficView setEditable:NO];
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
    [uneInfoTrafic release];
    [super dealloc];
}


@end
