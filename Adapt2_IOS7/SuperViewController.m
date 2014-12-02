//
//  SuperViewController.m
//  Adapt_IOS7
//
//  Created by zhoushejun on 14-6-21.
//  Copyright (c) 2014年 zhou. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()

@end

@implementation SuperViewController
@synthesize contentView = _contentView;
@synthesize labTitle = _labTitle;
@synthesize btnLeft  = _btnLeft;
@synthesize btnRight = _btnRight;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = LINE_GRAY_COLOR;
    /*!
     * iOS 版本低于 7.0 时，self.view 的坐标值从状态栏下方开始计算，此时的 n_contentView_y0 值为 0
     * iOS 版本高于或等于 7.0 时，self.view 的坐标值从主视图 (0, 0) 处开始算起，此时应将 n_contentView_y0 下移状态栏高度值 即 20 个点。且状态栏需向上展 20 个点，以作为 状态栏 的背景颜色。
     * 向左、向右按钮应添加在状态栏上。
     */
    int n_contentView_y0;   //contentView   y0
    int n_navitagionBar_y0; //navigationBar y0
    int n_navitagionBar_h;  //navigationBar hight
    if (IOS_VERSION < 7.0) {
        n_contentView_y0   = 0;
        n_navitagionBar_y0 = 0;
        n_navitagionBar_h  = 40;
    }else{
        n_contentView_y0   = 20;
        n_navitagionBar_y0 = -20;
        n_navitagionBar_h  = 60;
    }
    
    UIView *midView = [[UIView alloc] init];
    midView.frame = CGRectMake(0, n_contentView_y0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [midView becomeFirstResponder];
    midView.backgroundColor = BLACK_BACKGROUND_COLOR;
    
    int w_bar = n_navitagionBar_h - n_contentView_y0;
    //navigationBar
    UIView *navitagionBar = [[UIView alloc] init];
    navitagionBar.frame = CGRectMake(0, n_navitagionBar_y0, SCREEN_WIDTH, n_navitagionBar_h);
    [navitagionBar setBackgroundColor:BLUE_COLOR_Nav];
    [midView addSubview:navitagionBar];
    //title
    UILabel *labT  = [[UILabel alloc] init];
    labT.frame = CGRectMake(w_bar, 0, SCREEN_WIDTH-w_bar*2, w_bar);
    //    labT.font      = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    labT.font = [UIFont systemFontOfSize:22];
    labT.textColor = [UIColor whiteColor];
    labT.textAlignment = NSTextAlignmentCenter;
    labT.backgroundColor = [UIColor clearColor];
    NSArray *array = [self.navigationController viewControllers];

    labT.text = [NSString stringWithFormat:@"Test Title %lu", (unsigned long)[array count]];
    self.labTitle  = labT;
    [midView addSubview:self.labTitle];
    
    //left button
    UIButton *leftBut = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBut.frame = CGRectMake(5, 0, w_bar, w_bar);
    leftBut.backgroundColor = [UIColor clearColor];
    leftBut.imageView.contentMode = UIViewContentModeCenter;
    [leftBut setBackgroundImage:[UIImage imageNamed:@"lm_left.png"] forState:UIControlStateNormal];
    [leftBut addTarget:self action:@selector(leftGoBack:) forControlEvents:UIControlEventTouchUpInside];
    self.btnLeft = leftBut;
    [midView addSubview:self.btnLeft];
    
    //right button
    UIButton *rightBut = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBut.frame = CGRectMake(SCREEN_WIDTH-5-w_bar, 0, w_bar, w_bar);
    rightBut.backgroundColor = [UIColor clearColor];
    rightBut.imageView.contentMode = UIViewContentModeCenter;
    [rightBut setBackgroundImage:[UIImage imageNamed:@"lm_right.png"] forState:UIControlStateNormal];
    [rightBut addTarget:self action:@selector(rightGoNext:) forControlEvents:UIControlEventTouchUpInside];
    self.btnRight = rightBut;
    [midView addSubview:self.btnRight];
    self.contentView = midView;
    
    [self.view addSubview:self.contentView];
}

- (void)viewWillAppear:(BOOL)animated{
    NSArray *array = [self.navigationController viewControllers];
    if ([array count] == 1) {
        self.btnLeft.hidden = YES;
    }else {
        self.btnLeft.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)leftGoBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightGoNext:(id)sender{
    SuperViewController *ViewController = [[[self class] alloc] init];
    [self.navigationController pushViewController:ViewController animated:YES];
}

@end
