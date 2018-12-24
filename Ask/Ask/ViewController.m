//
//  ViewController.m
//  Ask
//
//  Created by lee on 2018/12/19.
//  Copyright © 2018 lee. All rights reserved.
//

#import "ViewController.h"
#import "AskNumView.h"
#import "AskViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)numberAction:(id)sender
{
	//[[AskNumView shared] show];
	AskViewController *askVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AskStoryboardId"];
	[self.navigationController pushViewController:askVC animated:YES];
}

@end
