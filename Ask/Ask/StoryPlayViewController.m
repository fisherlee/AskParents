//
//  StoryPlayViewController.m
//  Ask
//
//  Created by lee on 2018/12/25.
//  Copyright © 2018 lee. All rights reserved.
//

#import "StoryPlayViewController.h"

@interface StoryPlayViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *logoImgView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *startTimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalTimeLabel;
@property (nonatomic, weak) IBOutlet UITextView *descTextView;
@property (nonatomic, weak) IBOutlet UISlider *playSlider;
@property (nonatomic, weak) IBOutlet UIButton *favButton;
@property (nonatomic, weak) IBOutlet UIButton *playButton;
@property (nonatomic, weak) IBOutlet UIButton *preButton;
@property (nonatomic, weak) IBOutlet UIButton *nextButton;

@end

@implementation StoryPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_logoImgView.layer.cornerRadius = 11;
}


#pragma mark - button action

- (IBAction)favButtonAction:(id)sender
{
	
}

- (IBAction)playButtonAction:(id)sender
{
	
}

- (IBAction)preButtonAction:(id)sender
{
	
}

- (IBAction)nextButtonAction:(id)sender
{
	
}

- (IBAction)playSliderAction:(id)sender
{
	
}


@end
