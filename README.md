# SWStartViewController
应用的启动引导页面


自己尝试着写的应用启动引导页面
 NSArray *images=@[[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"2.png"],[UIImage imageNamed:@"3.png"],[UIImage imageNamed:@"5.png"]];
        StartViewController *strat=[[StartViewController alloc]initWithImageArray:images toViewController:[[MainViewController alloc]init]];
       UIWindow *wind= [[UIApplication sharedApplication].delegate window];
        wind.rootViewController=strat;
        需要传入一个图片数组，和viewController初始化引导页面，并将引导页面设为根视图。
