//
//  nextViewController.m
//  gitStudy
//
//  Created by wangjiale on 15/3/26.
//  Copyright (c) 2015年 wangjiale. All rights reserved.
//

#import "nextViewController.h"

@interface nextViewController ()

@end

@implementation nextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //整个屏幕
    CGRect theMainScreen = [[UIScreen mainScreen] bounds];
    //去掉导航栏整个屏幕
    CGRect r = [UIScreen mainScreen].applicationFrame;
    //NSLog(@"r.height = %f,r.width = %f,r.x = %f,r.y = %f",r.size.height,r.size.width,r.origin.x,r.origin.y);
    //状态栏(statusbar)
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    // 导航栏（navigationbar）
    CGRect rectNav = self.navigationController.navigationBar.frame;
    
    //创建一个导航栏
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, theMainScreen.size.width, theMainScreen.size.height/10)];
    
    //创建一个导航栏集合
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:nil];
    
    //创建一个左边按钮
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"左边"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(clickLeftButton)];
    
    //创建一个右边按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"右边"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(clickRightButton)];
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button1 setBackgroundColor:[UIColor yellowColor]];
    [button1 setTintColor:[UIColor blackColor]];
    [button1 setTitle:@"123" forState:UIControlStateNormal ];
    [self.view addSubview:button1];
    
    //设置导航栏内容
    [navigationItem setTitle:@"雨松MOMO程序世界"];
    
    
    //把导航栏集合添加入导航栏中，设置动画关闭
    [navigationBar pushNavigationItem:navigationItem animated:NO];
    
    //把左右两个按钮添加入导航栏集合中
    [navigationItem setLeftBarButtonItem:leftButton];
    [navigationItem setRightBarButtonItem:rightButton];
    
    //把导航栏添加到视图中
    [self.view addSubview:navigationBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickLeftButton
{
    
    [self showDialog:@"点击了导航栏左边按钮"];
    
}


-(void)clickRightButton
{
    
    [self showDialog:@"点击了导航栏右边按钮"];
    
}


-(void)showDialog:(NSString *) str
{
    
    UIAlertView * alert= [[UIAlertView alloc] initWithTitle:@"这是一个对话框" message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    [alert show];
    //[alert release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
