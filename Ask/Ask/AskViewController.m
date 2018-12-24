//
//  AskViewController.m
//  Ask
//
//  Created by lee on 2018/12/24.
//  Copyright © 2018 lee. All rights reserved.
//

#import "AskViewController.h"
#import "Masonry/Masonry.h"

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
		self.backgroundColor = [UIColor redColor];
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
		make.top.equalTo(self.contentView.mas_top).offset(5);
		make.left.equalTo(self.contentView.mas_left).offset(5);
		make.right.equalTo(self.contentView.mas_right).offset(-5);
		make.bottom.equalTo(self.contentView.mas_bottom).offset(-50);
	}];
	
	[self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.iconImgView.mas_bottom).offset(0);
		make.left.equalTo(self.contentView.mas_left).offset(5);
		make.right.equalTo(self.contentView.mas_right).offset(5);
		make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
	}];
	
	[self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.titleLabel.mas_bottom).offset(0);
		make.left.equalTo(self.contentView.mas_left).offset(5);
		make.right.equalTo(self.contentView.mas_right).offset(5);
		make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
	}];
}

- (UIImageView *)iconImgView
{
	if (!_iconImgView) {
		_iconImgView = [UIImageView new];
	}
	_iconImgView.backgroundColor = [UIColor blueColor];
	_iconImgView.contentMode = UIViewContentModeScaleAspectFill;
	return _iconImgView;
}

- (UILabel *)titleLabel
{
	if (!_titleLabel) {
		_titleLabel = [UILabel new];
	}
	_titleLabel.backgroundColor = [UIColor clearColor];
	_titleLabel.textAlignment = NSTextAlignmentCenter;
	_titleLabel.textColor = [UIColor blackColor];
	_titleLabel.font = [UIFont systemFontOfSize:15];
	_titleLabel.numberOfLines = 1;
	return _titleLabel;
}

- (UILabel *)descLabel
{
	if (!_descLabel) {
		_descLabel = [UILabel new];
	}
	_descLabel.backgroundColor = [UIColor clearColor];
	_descLabel.textAlignment = NSTextAlignmentCenter;
	_descLabel.textColor = [UIColor blackColor];
	_descLabel.font = [UIFont systemFontOfSize:13];
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
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
	
}


#pragma mark - setup view
- (void)setupCollectionView
{

	CGFloat lw = (self.view.frame.size.width-60-24)/2;
	CGFloat lh =  lw*4/3;
	
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
	layout.scrollDirection = UICollectionViewScrollDirectionVertical;
	layout.minimumLineSpacing = 30;
	layout.minimumInteritemSpacing = 10;
	layout.sectionInset = UIEdgeInsetsMake(10, 30, 10, 30);
	layout.itemSize = CGSizeMake(lw, lh);
	
	_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
										 collectionViewLayout:layout];
	_collectionView.backgroundColor = [UIColor blueColor];
	_collectionView.delegate = self;
	_collectionView.dataSource = self;
	[self.view addSubview:_collectionView];
	
	[_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.mas_equalTo(UIEdgeInsetsZero);
	}];

	[_collectionView registerClass:[AskCollectionCell class] forCellWithReuseIdentifier:KAskCollectionCellId];
}


@end
