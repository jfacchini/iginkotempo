//
//  StationTableViewCell.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//
//  Correspond à une ligne dans le TableView


#import "StationTableViewCell.h"
#import "Station.h"

@implementation StationTableViewCell


@synthesize station;
@synthesize labelView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    //SI il n'est pas encore initialité, on le fait, sinon on passe.
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //On réunitialise tout à nil
		station = nil;
		labelView = nil;
        
		// create the elementTileView and the labelView
		// both of these will be laid out again by the layoutSubviews method
        
        // On initialise le StationTileView (icone à droite)
		
        /*
        StationTileView *tileView = [[StationTileView alloc] initWithFrame:CGRectZero];
		self.stationTileView = tileView;
		[self.contentView addSubview:tileView];
		[tileView release];
        */  
        // On initialisse le UILabel
        
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
		// set the label view to have a clear background and a 20 point font
		label.backgroundColor = [UIColor clearColor];
		label.font = [UIFont boldSystemFontOfSize:20];
		self.labelView = label;
		[self.contentView addSubview:label];
		[label release];
		
		
		// add both the label and elementTile to the TableViewCell view
    }

    return self;
    
}


- (void)layoutSubviews {
	[super layoutSubviews];

	// determine the content rect for the cell. This will change depending on the
	// style of table (grouped vs plain)
	CGRect contentRect = self.contentView.bounds;
	
	// position the elment name in the content rect
	CGRect labelRect = contentRect;
	labelRect.origin.x = labelRect.origin.x+8;
	labelView.frame = labelRect;	
}


- (void)dealloc {
	[station release];
	[labelView release];
    [super dealloc];
}


// the element setter
// we implement this because the table cell values need
// to be updated when this property changes, and this allows
// for the changes to be encapsulated

- (void)setElement:(Station *)aStation {
    
	if (aStation != station) {
		[station release];
		[aStation retain];
		station = aStation;
	}
    
	labelView.text = station.name;
	[labelView setNeedsDisplay];
}

@end
