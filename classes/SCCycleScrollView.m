//
//  SCCycleScrollView.m
//  shuangChuang
//
//  Created by sc on 2017/8/7.
//  Copyright © 2017年 魏国清. All rights reserved.
//

#import "SCCycleScrollView.h"

NSString * const ID = @"cycleCell";

@interface SCCycleScrollView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *mainView; // 显示图片的collectionView
@property (nonatomic, weak) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger totalItemsCount;


@property (nonatomic, strong) UILabel *title;

@end
@implementation SCCycleScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _autoScrollTimeInterval = 1.0;
        [self setupMainView];
    }
    return self;
}

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup
{
    SCCycleScrollView *cycleScrollView = [[self alloc] initWithFrame:frame];
    cycleScrollView.imagesGroup = imagesGroup;
    return cycleScrollView;
}

// 设置显示图片的collectionView
- (void)setupMainView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(200, 200);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _flowLayout = flowLayout;
    
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) collectionViewLayout:flowLayout];
//    mainView.backgroundColor = [UIColor lightGrayColor];
    mainView.pagingEnabled = YES;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    [mainView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    mainView.dataSource = self;
    mainView.delegate = self;
    [self addSubview:mainView];
    _mainView = mainView;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    int R = (arc4random() % 256);
//    int G = (arc4random() % 256);
//    int B = (arc4random() % 256);
//    cell.backgroundColor=[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0];
//    if (!self.title) {
//    if (self.title) {
////        self.title.text=[NSString stringWithFormat:@"%zd",indexPath.row];
//    }else{
    
    

    for (int i=0; i<cell.subviews.count; i++) {
        NSLog(@"%@",cell.subviews[i]);
        if ([cell.subviews[i] isKindOfClass:[UILabel class]]) {
            [cell.subviews[i] removeFromSuperview];
        }
    }
    
    UILabel *title=[[UILabel alloc]init];
    title.frame=cell.bounds;
    title.text=[NSString stringWithFormat:@"%zd",indexPath.row];
    title.textColor=[UIColor grayColor];
    [cell.contentView addSubview:title];
    
//    }
//    }
//    self.title.text=[NSString stringWithFormat:@"%zd",indexPath.row];
    cell.backgroundColor=[UIColor whiteColor];
    return cell;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

//    int currentIndex = _mainView.contentOffset.x / _flowLayout.itemSize.width;
//    int targetIndex = currentIndex + 1;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x > self.bounds.size.width * (2)) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0
                                                     inSection:0];
        
        [self.mainView scrollToItemAtIndexPath:indexPath
                              atScrollPosition:UICollectionViewScrollPositionNone
                                      animated:NO];
    }
    
}
@end
