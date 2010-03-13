//
//  StationTableViewCell.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//
//  Correspond à une ligne dans le TableView


#import "TempsAttentesTableViewCell.h"
#import "TempsAttentes.h"
#import "LigneTileView.h"

@implementation TempsAttentesTableViewCell


@synthesize temps;
@synthesize labelView;
@synthesize ligneTileView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    //SI il n'est pas encore initialité, on le fait, sinon on passe.
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //On réunitialise tout à nil
		temps = nil;
		labelView = nil;
        ligneTileView = nil;
        
		// create the elementTileView and the labelView
		// both of these will be laid out again by the layoutSubviews method
        
        // On initialise le StationTileView (icone à droite)
		
        
        LigneTileView *tileView = [[LigneTileView alloc] initWithFrame:CGRectZero];
        self.ligneTileView = tileView;
        [self.contentView addSubview:tileView];
        [tileView release];
        
        
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
		// set the label view to have a clear background and a 20 point font
		label.backgroundColor = [UIColor clearColor];
		label.font = [UIFont boldSystemFontOfSize:18];
        
        label.text = temps.ligne.direction;
        
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
	
	// position the image tile in the content rect.
	CGRect elementTileRect = self.contentView.bounds;
	elementTileRect.size = [LigneTileView preferredViewSize];
	elementTileRect = CGRectOffset(elementTileRect,10,3);
	ligneTileView.frame = elementTileRect;
    
    
	// position the elment name in the content rect
	CGRect labelRect = contentRect;
	labelRect.origin.x = labelRect.origin.x+56;
	labelRect.origin.y = labelRect.origin.y+3;
	labelView.frame = labelRect;	
}


- (void)dealloc {
	[temps release];
	[labelView release];
    [super dealloc];
}


// the element setter
// we implement this because the table cell values need
// to be updated when this property changes, and this allows
// for the changes to be encapsulated

- (void)setElement:(TempsAttentes *)aTemps {
    
	if (aTemps != temps) {
		[temps release];
		[aTemps retain];
		temps = aTemps;
	}
    
    ligneTileView.ligne = temps.ligne;
	labelView.text = temps.ligne.direction;
	[labelView setNeedsDisplay];
}

@end
