//
//  ViewController.m
//  StartView
//
//  Created by mac on 16/3/18.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "ViewController.h"
#import "SWJudgeClass.h"
#import "MainViewController.h"
#import "StartViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
-(void)viewDidAppear:(BOOL)animated
{
    BOOL is= [SWJudgeClass isFirstEnter];
    if (!is){
        [self enterMain];
    }else{
        NSLog(@"进入启动页");
        
        NSArray *images=@[[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"2.png"],[UIImage imageNamed:@"3.png"],[UIImage imageNamed:@"5.png"]];
        StartViewController *strat=[[StartViewController alloc]initWithImageArray:images toViewController:[[MainViewController alloc]init]];
//        [self.view addSubview:strat.view];
       UIWindow *wind= [[UIApplication sharedApplication].delegate window];
        wind.rootViewController=strat;
    }
}
-(void)enterMain
{
    MainViewController *main=[[MainViewController alloc]init];
    [self presentViewController:main animated:YES completion:^{
        NSLog(@"进入主页面");
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
