//
//  MainViewController.m
//  AlertViewController
//
//  Created by shen on 17/4/18.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "MainViewController.h"

#import "SSActionSheet.h"
#import "AlertView.h"
#import "CKAlertViewController.h"


@interface MainViewController ()<SSActionSheetDelegate>{
    
    NSArray *_dataArr;
}
@property(nonatomic,strong) SSActionSheet *actionSheetImg;
@property(nonatomic,strong) SSActionSheet *actionSheetTitle;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我是要成为大牛的人";
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.004 green:0.651 blue:0.996 alpha:1.000]];
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    
    _dataArr = @[@"AlertViewController",@"AlertView",@"ActionSheet文字",@"ActionSheet图片"];
    
    
}

#pragma mark - TableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _dataArr[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //第一种简洁的提示框
    if (indexPath.row == 0) {
        
        CKAlertViewController *alertVC = [CKAlertViewController alertControllerWithTitle:@"温馨提示" message:@"无(sheng)聊(wu)至(ke)极(lian)"];
        CKAlertAction *cancel = [CKAlertAction actionWithTitle:@"取消" handler:^(CKAlertAction *action) {
            NSLog(@"点击了 %@ 按钮",action.title);
        }];
        CKAlertAction *sure = [CKAlertAction actionWithTitle:@"确定" handler:^(CKAlertAction *action) {
            NSLog(@"点击了 %@ 按钮",action.title);
        }];
        
        [alertVC addAction:cancel];
        [alertVC addAction:sure];
        [self presentViewController:alertVC animated:NO completion:nil];
        
    }
    
    //第二种自由定制比较方便
    if (indexPath.row == 1) {
        
        AlertView *alert = [[AlertView alloc] initWithTitle:@"温馨提示" button1:@"跳转button1" button2:@"跳转button2" cancleBtn:@"跳过"];
        alert.returnIndex = ^(NSInteger index){
            
            NSLog(@"%ld",(long)index);
        };
        [alert showAlertView];
        
        
    }
    //第三种 第四看情况用
    if (indexPath.row == 2) {
        
        [self.actionSheetTitle showSSActionSheet];
        
    }
    if (indexPath.row == 3) {
        
        [self.actionSheetImg showSSActionSheet];
    }
    
    
}


#pragma mark - SSActionSheet代理方法
-(void)SSActionSheetClickWithIndex:(int)index{
    
    NSLog(@"--------->点击了第%d个按钮<----------",index);
}

-(SSActionSheet *)actionSheetImg{
    if (!_actionSheetImg) {
        _actionSheetImg = [SSActionSheet ActionSheetWithImageArray:@[@"logo1",@"logo2"] delegate:self];
        //设置取消按钮的颜色
        //        _actionSheetImg.cancelDefaultColor = [UIColor redColor];
    }
    return _actionSheetImg;
}

-(SSActionSheet *)actionSheetTitle{
    if (!_actionSheetTitle) {
        _actionSheetTitle = [SSActionSheet ActionSheetWithTitleArray:@[@"支付宝支付",@"微信支付"] andTitleColorArray:@[[UIColor blackColor]] delegate:self];
        // 设置按钮的 字体颜色
        //        _actionSheetTitle.cancelDefaultColor = [UIColor blueColor];
        //        _actionSheetTitle.optionDefaultColor = [UIColor greenColor];
    }
    return _actionSheetTitle;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
