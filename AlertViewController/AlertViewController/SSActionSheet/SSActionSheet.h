//
//  SSActionSheet.h
//  ActionSheet-TestDome
//
//  Created by shen on 17/4/12.
//  Copyright © 2017年 shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SSActionSheetDelegate<NSObject>

-(void)SSActionSheetClickWithIndex:(int)index;
@end

@interface SSActionSheet : UIView

@property(nonatomic,weak) id <SSActionSheetDelegate> delegate;
//默认取消按钮颜色
@property(nonatomic,strong) UIColor *cancelDefaultColor;
//默认选项按钮颜色
@property(nonatomic,strong) UIColor *optionDefaultColor;

//创建标题形式ActionSheet
+(instancetype)ActionSheetWithTitleArray:(NSArray *)titleArray  andTitleColorArray:(NSArray *)colors delegate:(id<SSActionSheetDelegate>)delegate;

//创建图片形式ActionSheet
+(instancetype)ActionSheetWithImageArray:(NSArray *)imgArray delegate:(id<SSActionSheetDelegate>)delegate;

//显示ActionSheet
-(void)showSSActionSheet;


@end
