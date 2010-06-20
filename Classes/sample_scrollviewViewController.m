//
//  sample_scrollviewViewController.m
//  sample-scrollview
//
//  Created by muanis on 12/20/09.
//  Copyright http://www.iphonesampleapps.com 2009. All rights reserved.
//

#define SCROLLVIEW_CONTENT_HEIGHT 460
#define SCROLLVIEW_CONTENT_WIDTH  320

#import "sample_scrollviewViewController.h"

@implementation sample_scrollviewViewController

@synthesize scrollview,tx1,tx2;

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSLog(@"Registering for keyboard events");
	
	// Register for the events
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector (keyboardDidShow:)
	 name: UIKeyboardDidShowNotification
	 object:nil];
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector (keyboardDidHide:)
	 name: UIKeyboardDidHideNotification
	 object:nil];
	
	// Setup content size
	scrollview.contentSize = CGSizeMake(SCROLLVIEW_CONTENT_WIDTH,
										SCROLLVIEW_CONTENT_HEIGHT);
	
	//Initially the keyboard is hidden
	keyboardVisible = NO;
}

-(void) viewWillDisappear:(BOOL)animated {
	NSLog (@"Unregister for keyboard events");
	[[NSNotificationCenter defaultCenter]
	 removeObserver:self];
}

-(void) keyboardDidShow: (NSNotification *)notif {
	NSLog(@"Keyboard is visible");
	// If keyboard is visible, return
	if (keyboardVisible) {
		NSLog(@"Keyboard is already visible. Ignore notification.");
		return;
	}
	
	// Get the size of the keyboard.
	NSDictionary* info = [notif userInfo];
	NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
	
	// Save the current location so we can restore
	// when keyboard is dismissed
	offset = scrollview.contentOffset;
	
	// Resize the scroll view to make room for the keyboard
	CGRect viewFrame = scrollview.frame;
	viewFrame.size.height -= keyboardSize.height;
	scrollview.frame = viewFrame;
	
	CGRect textFieldRect = [activeField frame];
	textFieldRect.origin.y += 10;
	[scrollview scrollRectToVisible:textFieldRect animated:YES];
	
	NSLog(@"ao fim");
	// Keyboard is now visible
	keyboardVisible = YES;
}

-(void) keyboardDidHide: (NSNotification *)notif {
	// Is the keyboard already shown
	if (!keyboardVisible) {
		NSLog(@"Keyboard is already hidden. Ignore notification.");
		return;
	}
	
	// Reset the frame scroll view to its original value
	scrollview.frame = CGRectMake(0, 0, SCROLLVIEW_CONTENT_WIDTH, SCROLLVIEW_CONTENT_HEIGHT);
	
	// Reset the scrollview to previous location
	scrollview.contentOffset = offset;
	
	// Keyboard is no longer visible
	keyboardVisible = NO;
	
}

-(BOOL) textFieldShouldBeginEditing:(UITextField*)textField {
	activeField = textField;
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


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
    [super dealloc];
}

@end
