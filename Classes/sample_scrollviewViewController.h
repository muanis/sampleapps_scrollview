//
//  sample_scrollviewViewController.h
//  sample-scrollview
//
//  Created by muanis on 12/20/09.
//  Copyright http://www.iphonesampleapps.com 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sample_scrollviewViewController : UIViewController {
    IBOutlet UIScrollView *scrollview;
    IBOutlet UITextField *tx1;
    IBOutlet UITextField *tx2;
	
	BOOL keyboardVisible;
	CGPoint offset;
	UITextField *activeField;
}

@property(nonatomic,retain) IBOutlet UIScrollView *scrollview;
@property(nonatomic,retain) IBOutlet UITextField *tx1;
@property(nonatomic,retain) IBOutlet UITextField *tx2;

@end

