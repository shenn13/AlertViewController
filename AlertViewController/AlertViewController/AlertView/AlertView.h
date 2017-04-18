//
//  AlertView.h
//  AlertView
//
//  Created by shen on 17/4/13.
//  Copyright © 2017年 shen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^alertReturn)(NSInteger index);

@interface AlertView : UIView

@property (nonatomic,copy) alertReturn returnIndex;

- (instancetype)initWithTitle:(NSString *)title button1:(NSString *)button1 button2:(NSString *)button2 cancleBtn:(NSString *)cancleBtn;

- (void)showAlertView;

@end
