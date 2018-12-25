//
//  AskViewController.m
//  Ask
//
//  Created by lee on 2018/12/24.
//  Copyright © 2018 lee. All rights reserved.
//

#import "AskViewController.h"
#import "Masonry/Masonry.h"
#import "StoryPlayViewController.h"

@interface AskCollectionCell()

@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation AskCollectionCell

- (void)awakeFromNib
{
	[super awakeFromNib];
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor whiteColor];
		[self addSubview:self.iconImgView];
		[self addSubview:self.titleLabel];
		[self addSubview:self.descLabel];
		
		[self subViewContaints];
	}
	return self;
}

- (void)subViewContaints
{
	[self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.contentView.mas_top).offset(0);
		make.left.equalTo(self.contentView.mas_left).offset(0);
		make.right.equalTo(self.contentView.mas_right).offset(0);
		make.height.mas_equalTo(CGRectGetWidth(self.contentView.frame));
		make.height.mas_equalTo(self.iconImgView.mas_width).multipliedBy(1);
	}];
	
	[self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.contentView.mas_left).offset(1);
		make.right.equalTo(self.contentView.mas_right).offset(-1);
		make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
		make.height.mas_equalTo(@20);
	}];
	
	[self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.contentView.mas_left).offset(1);
		make.right.equalTo(self.contentView.mas_right).offset(-1);
		make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
		make.height.mas_equalTo(@20);
	}];
}

- (UIImageView *)iconImgView
{
	if (!_iconImgView) {
		_iconImgView = [UIImageView new];
	}
	_iconImgView.backgroundColor = [UIColor lightGrayColor];
	_iconImgView.contentMode = UIViewContentModeScaleAspectFill;
	_iconImgView.layer.cornerRadius = 11;
	return _iconImgView;
}

- (UILabel *)titleLabel
{
	if (!_titleLabel) {
		_titleLabel = [UILabel new];
	}
	_titleLabel.backgroundColor = [UIColor clearColor];
	_titleLabel.textAlignment = NSTextAlignmentLeft;
	_titleLabel.textColor = [UIColor blackColor];
	_titleLabel.font = [UIFont systemFontOfSize:14];
	_titleLabel.numberOfLines = 1;
	return _titleLabel;
}

- (UILabel *)descLabel
{
	if (!_descLabel) {
		_descLabel = [UILabel new];
	}
	_descLabel.backgroundColor = [UIColor clearColor];
	_descLabel.textAlignment = NSTextAlignmentLeft;
	_descLabel.textColor = [UIColor lightGrayColor];
	_descLabel.font = [UIFont systemFontOfSize:12];
	_descLabel.numberOfLines = 1;
	return _descLabel;
}

@end

@interface AskViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *listArray;

@end


NSString * const KAskCollectionCellId = @"KAskCollectionCellId";

@implementation AskViewController

- (void)dealloc{
	
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	_listArray = [[NSMutableArray alloc] init];
	
	[self setupCollectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return 10;//[_listArray count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	AskCollectionCell *cell = (AskCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:KAskCollectionCellId forIndexPath:indexPath];
	
	if ([_listArray count] > 0) {

	}
	cell.titleLabel.text = @"11111";
	cell.descLabel.text = @"2222222";
	
	return cell;
}

#pragma mark - UICollectionViewDelegate
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
	return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"didSelectItemAtIndexPath");
	StoryPlayViewController *storyPlayVC = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPlayStoryboardId"];
	[self.navigationController pushViewController:storyPlayVC animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
	
}


#pragma mark - setup view
- (void)setupCollectionView
{
	CGFloat padding = 14;
	CGFloat lw = (CGRectGetWidth(self.view.frame)-padding*2-12)/2;
	CGFloat lh =  lw+50;
	
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
	layout.scrollDirection = UICollectionViewScrollDirectionVertical;
	layout.minimumLineSpacing = 20;
	layout.minimumInteritemSpacing = 10;
	layout.sectionInset = UIEdgeInsetsMake(10, padding, 10, padding);
	layout.itemSize = CGSizeMake(lw, lh);
	
	_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
										 collectionViewLayout:layout];
	_collectionView.backgroundColor = [UIColor whiteColor];
	_collectionView.delegate = self;
	_collectionView.dataSource = self;
	[self.view addSubview:_collectionView];
	
	[_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.mas_equalTo(UIEdgeInsetsZero);
	}];

	[_collectionView registerClass:[AskCollectionCell class] forCellWithReuseIdentifier:KAskCollectionCellId];
}


@end
