//
//  LignesTableViewCell.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 24/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LigneTableViewCell.h"
#import "Ligne.h"
#import "LigneTileView.h"

@implementation LignesTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    //SI il n'est pas encore initialité, on le fait, sinon on passe.
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //On réunitialise tout à nil
		ligne = nil;
		ligneTileView = nil;
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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
	[super layoutSubviews];
    
	// determine the content rect for the cell. This will change depending on the
	// style of table (grouped vs plain)
	CGRect contentRect = self.contentView.bounds;
	
	// position the image tile in the content rect.
	CGRect ligneTileRect = self.contentView.bounds;
	ligneTileRect.size = [LigneTileView preferredViewSize];
	ligneTileRect = CGRectOffset(ligneTileRect,10,3);
	ligneTileView.frame = ligneTileRect;
	
	// position the elment name in the content rect
	CGRect labelRect = contentRect;
	labelRect.origin.x = labelRect.origin.x+8;
	labelRect.origin.y = labelRect.origin.y+3;
	labelView.frame = labelRect;	
}


- (void)dealloc {
    [super dealloc];
}

- (void)setElement:(Ligne *)aLigne {
    
	if (aLigne != ligne) {
		[ligne release];
		[aLigne retain];
		ligne = aLigne;
	}
    
    
	ligneTileView.ligne = ligne;
	labelView.text = ligne.direction;
	[ligneTileView setNeedsDisplay];
	[labelView setNeedsDisplay];
}


@end
