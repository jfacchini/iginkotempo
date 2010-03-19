//
//  main.m
//  GinkoTempo
//
//  Created by Sébastien BARBIER on 11/02/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue &amp; 0xFF0000) &gt;&gt; 16))/255.0 \
green:((float)((rgbValue &amp; 0xFF00) &gt;&gt; 8))/255.0 \
blue:((float)(rgbValue &amp; 0xFF))/255.0 alpha:1.0]


int main(int argc, char *argv[]) {

   
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    int retVal = UIApplicationMain(argc, argv, nil, @"GinkoTempoAppDelegate");
    
    [pool release];
    
    return retVal;
}
