//
//  sample_scrollviewAppDelegate.h
//  sample-scrollview
//
//  Created by muanis on 12/20/09.
//  Copyright http://www.iphonesampleapps.com 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class sample_scrollviewViewController;

@interface sample_scrollviewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    sample_scrollviewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet sample_scrollviewViewController *viewController;

@end

