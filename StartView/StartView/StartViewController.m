//
//  StartViewController.m
//  StartView
//
//  Created by mac on 16/3/18.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "StartViewController.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@interface StartViewController ()

@end

@implementation StartViewController
{
    UIViewController *viewController;
    CGPoint startPoint;
    CGPoint movePoint;
    NSArray *viewImageArray;
    CALayer *mainLayer;
    NSMutableArray *moveArray;
    int j;
    int swipLeftCount;
}

-(id)initWithImageArray:(NSArray *)imageArray toViewController:(UIViewController *)toViewController
{
    self = [super init];
    if (self) {
        viewImageArray=imageArray;
        viewController=toViewController;
        moveArray=[[NSMutableArray alloc]init];
        j=0;
        swipLeftCount=0;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    mainLayer=[CALayer layer];
    mainLayer.frame=CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    mainLayer.contents=(__bridge id _Nullable)([viewImageArray[0] CGImage]);
    [self.view.layer addSublayer:mainLayer];
    [self addGesture];
}
-(void)addGesture
{
    UISwipeGestureRecognizer *swipeLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    swipeLeft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    swipeRight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}
-(void)goToNextViewController
{
    UIWindow *wind=[[UIApplication sharedApplication].delegate window];
    wind.rootViewController=viewController;
}
-(void)swipe:(UISwipeGestureRecognizer *)swipe
{
    if (swipe.direction==UISwipeGestureRecognizerDirectionLeft) {
        swipLeftCount++;
        [self changeLayerForLeft];
        if (swipLeftCount==viewImageArray.count) {
            [self goToNextViewController];
            
        }
    }
    if (swipe.direction==UISwipeGestureRecognizerDirectionRight) {
        [self changeLayerForRight];
        
    }
}

-(void)changeLayerForRight
{
    CATransition *trans=[[CATransition alloc]init];
    
    
        if (j>0) {
        trans.duration=1;
        trans.type=kCATransitionFade;
        trans.subtype=kCATransitionFromLeft;
        j--;
        [mainLayer addAnimation:trans forKey:nil];
        mainLayer.contents=(__bridge id _Nullable)([viewImageArray[j] CGImage]);
         
    }
    
}

-(void)changeLayerForLeft
{
    CATransition *trans=[[CATransition alloc]init];
    
    if (j<viewImageArray.count-1) {
        trans.duration=1;
        trans.type=kCATransitionFade;
        trans.subtype=kCATransitionFromRight;
        j++;
        [mainLayer addAnimation:trans forKey:nil];
         mainLayer.contents=(__bridge id _Nullable)([viewImageArray[j] CGImage]);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
