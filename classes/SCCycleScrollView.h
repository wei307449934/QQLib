//
//  SCCycleScrollView.h
//  shuangChuang
//
//  Created by sc on 2017/8/7.
//  Copyright © 2017年 魏国清. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    SDCycleScrollViewPageContolAlimentRight,
    SDCycleScrollViewPageContolAlimentCenter
} SCCycleScrollViewPageContolAliment;
@class SCCycleScrollView;

@protocol SCCycleScrollViewDelegate <NSObject>

- (void)cycleScrollView:(SCCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;

@end

@interface SCCycleScrollView : UIView
//图片数组
@property (nonatomic, strong) NSArray *imagesGroup;
//标题数组，此处是为了方便善变的产品需求变更
@property (nonatomic, strong) NSArray *titlesGroup;

@property (nonatomic, assign) CGFloat autoScrollTimeInterval;

@property (nonatomic, assign) SCCycleScrollViewPageContolAliment pageControlAliment;

@property (nonatomic, weak) id<SCCycleScrollViewDelegate> delegate;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup;


@end
