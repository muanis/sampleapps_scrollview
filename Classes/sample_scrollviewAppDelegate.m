//
//  sample_scrollviewAppDelegate.m
//  sample-scrollview
//
//  Created by muanis on 12/20/09.
//  Copyright http://www.iphonesampleapps.com 2009. All rights reserved.
//

#import "sample_scrollviewAppDelegate.h"
#import "sample_scrollviewViewController.h"

@implementation sample_scrollviewAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
