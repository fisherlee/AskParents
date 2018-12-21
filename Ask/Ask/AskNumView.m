//
//  AskNumView.m
//  Ask
//
//  Created by lee on 2018/12/20.
//  Copyright © 2018 lee. All rights reserved.
//

#import "AskNumView.h"
#import "Masonry/Masonry.h"

@interface AskNumView ()
{
	UIWindow *win;
}

@property (nonatomic, strong) UIButton *bgButton;
@property (nonatomic, strong) UIView *conView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *msgLabel;
@property (nonatomic, strong) UIView *numView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *closeButton;


@end

#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation AskNumView

+ (AskNumView *)shared
{
	static AskNumView *apv = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		apv = [[AskNumView alloc] init];
	});
	return apv;
}

- (id)init
{
	self = [super init];
	if (self) {
		
	}
	return self;
}

//显示
- (void)show
{
	self.frame = [[UIScreen mainScreen] bounds];
	self.alpha = 0.f;
	
	win =  [[UIApplication sharedApplication] keyWindow];
	[win addSubview:self];
	
	[self addSubview:self.bgButton];
	[self addSubview:self.conView];
	[self.conView addSubview:self.titleLabel];
	[self.conView addSubview:self.msgLabel];
	[self.conView addSubview:self.numView];
	[self.conView addSubview:self.lineView];
	[self.conView addSubview:self.closeButton];
	
	//
	//_titleLabel.text = @"请验证您是家长:";

	NSInteger random = arc4random()%2+1;
	self.msgLabel.text = [NSString stringWithFormat:@"请找出下面所有的%@数", random==1?@"奇":@"偶"];
	
	//
	[self subContaintsView];
	
	//--
	[UIView animateWithDuration:0.3 animations:^{
		self.alpha = 1.f;
	}];
}

- (void)hiddenViewAction
{
	[UIView animateWithDuration:0.3 animations:^{
		self.alpha = 0;
		[self removeFromSuperview];
	}];
}

- (void)subContaintsView
{
	// ---
	[self.bgButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.mas_equalTo(UIEdgeInsetsZero);
	}];
	
	CGFloat height = kScreenHeight/2;
	[self.conView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerY.equalTo(self.mas_centerY).offset(0);
		make.left.equalTo(self.mas_left).offset(50);
		make.right.equalTo(self.mas_right).offset(-50);
		make.height.mas_equalTo(@(height));
	}];
	
	CGFloat off_set = 20;
	[self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.conView.mas_top).offset(5);
		make.left.equalTo(self.conView.mas_left).offset(off_set);
		make.right.equalTo(self.conView.mas_right).offset(-off_set);
		make.height.mas_equalTo(@40);
	}];
	
	[self.msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.titleLabel.mas_bottom).offset(2);
		make.left.equalTo(self.conView.mas_left).offset(off_set);
		make.right.equalTo(self.conView.mas_right).offset(-off_set);
		make.height.mas_equalTo(@30);
	}];
	
	[self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.equalTo(self.conView.mas_bottom).offset(-5);
		make.centerX.equalTo(self.conView.mas_centerX).offset(0);
		make.left.equalTo(self.conView.mas_left).offset(off_set);
		make.right.equalTo(self.conView.mas_right).offset(-off_set);
		//make.width.mas_equalTo(@100);
		make.height.mas_equalTo(@40);
	}];
	
	[self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.equalTo(self.closeButton.mas_top).offset(-5);
		make.left.equalTo(self.conView.mas_left).offset(0);
		make.right.equalTo(self.conView.mas_right).offset(-0);
		make.height.mas_equalTo(@1);
	}];
	
	[self.numView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.msgLabel.mas_bottom).offset(5);
		make.bottom.equalTo(self.lineView.mas_top).offset(-5);
		make.left.equalTo(self.conView.mas_left).offset(off_set);
		make.right.equalTo(self.conView.mas_right).offset(-off_set);
	}];
}

#pragma mark - view

- (UIButton *)bgButton
{
	if (!_bgButton) {
		_bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
	}
	_bgButton.backgroundColor = [UIColor blackColor];
	_bgButton.alpha = 0.3;
	return _bgButton;
}

- (UIView *)conView
{
	if (!_conView) {
		_conView = [UIView new];
	}
	_conView.backgroundColor = [UIColor whiteColor];
	_conView.layer.cornerRadius = 11.f;
	return _conView;
}

- (UILabel *)titleLabel
{
	if (!_titleLabel) {
		_titleLabel = [UILabel new];
	}
	_titleLabel.backgroundColor = [UIColor lightGrayColor];
	_titleLabel.adjustsFontSizeToFitWidth = YES;
	_titleLabel.textColor = [UIColor blackColor];
	_titleLabel.font = [UIFont boldSystemFontOfSize:18];
	_titleLabel.textAlignment = NSTextAlignmentCenter;
	return _titleLabel;
}

- (UILabel *)msgLabel
{
	if (!_msgLabel) {
		_msgLabel = [UILabel new];
	}
	_msgLabel.backgroundColor = [UIColor lightTextColor];
	_msgLabel.adjustsFontSizeToFitWidth = YES;
	_msgLabel.textColor = [UIColor blackColor];
	_msgLabel.font = [UIFont boldSystemFontOfSize:18];
	_msgLabel.textAlignment = NSTextAlignmentCenter;
	return _msgLabel;
}

- (UIView *)numView
{
	if (!_numView) {
		_numView = [UIView new];
	}
	_numView.backgroundColor = [UIColor blueColor];
	return _numView;
}

- (UIView *)lineView
{
	if (!_lineView) {
		_lineView = [UIView new];
	}
	_lineView.backgroundColor = [UIColor orangeColor];
	return _lineView;
}

- (UIButton *)closeButton
{
	if (!_closeButton) {
		_closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
	}
	_closeButton.backgroundColor = [UIColor clearColor];
	[_closeButton setTitle:@"关闭" forState:UIControlStateNormal];
	[_closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	_closeButton.layer.borderColor = [UIColor orangeColor].CGColor;
	[_closeButton addTarget:self action:@selector(hiddenViewAction) forControlEvents:UIControlEventTouchUpInside];
	return _closeButton;
}
@end
