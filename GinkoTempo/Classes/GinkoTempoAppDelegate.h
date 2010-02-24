//
//  GinkoTempoAppDelegate.h
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GinkoTempoAppDelegate : NSObject <UIApplicationDelegate> {

    // Windows qui contient l'application.
    UIWindow *window;
    
    // TabBar : Bar inferieur de navigation
    UITabBarController *tabBarController;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;


@end

