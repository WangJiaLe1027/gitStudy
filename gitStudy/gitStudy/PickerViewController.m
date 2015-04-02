//
//  PickerViewController.m
//  gitStudy
//
//  Created by wangjiale on 15/4/1.
//  Copyright (c) 2015年 wangjiale. All rights reserved.
//



#import "PickerViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HIGHT ([UIScreen mainScreen].bounds.size.height)



@interface PickerViewController () <UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    NSArray *pickerArray;
}
@property (strong, nonatomic) IBOutlet UIPickerView *thePickerView;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UILabel *Label1;
 @end

@implementation PickerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    pickerArray = [NSArray arrayWithObjects:@"动物",@"植物",@"石头",@"天空",@"世界", nil];
    
    self.Label1 = [[UIla alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.191, 100, SCREEN_WIDTH*0.618, 50)];
    self.theTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.theTextField];
    
    
    
    
    self.thePickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HIGHT, SCREEN_WIDTH, 100)];
    self.thePickerView.delegate = self ;
    [self.view addSubview:self.thePickerView];
    
    self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.191, SCREEN_HIGHT, SCREEN_WIDTH*0.618, 60)];
    self.button1.backgroundColor = [UIColor yellowColor];
    self.button1.showsTouchWhenHighlighted = YES;
    
    [self.view addSubview:self.button1];
    [self.button1 addTarget:self action:@selector(selectButton) forControlEvents:UIControlEventTouchUpInside];
    //self.thePickerView.hidden = YES;
    //self.button1.hidden = YES;
    UILongPressGestureRecognizer *longPressGR =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(handleLongPress2:)];
    longPressGR.allowableMovement=NO;
    longPressGR.minimumPressDuration = 0.000001;
    [self.theTextField addGestureRecognizer:longPressGR];
    //[longPressGR release];
    //响应的事件

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)handleLongPress2:(id)sender{
    self.thePickerView.frame = CGRectMake(0, 300, SCREEN_WIDTH, 100);
    self.button1.frame = CGRectMake(SCREEN_WIDTH * 0.191, 500, SCREEN_WIDTH*0.618, 60);
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)PickerView{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}
/*
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger row = [self.thePickerView selectedRowInComponent:0];
    self.theTextField.text = [pickerArray objectAtIndex:row];
}
*/

- (IBAction)selectButton{
    [self textFieldDidEndEditing:self.theTextField];
    self.button1.frame = CGRectMake(0, SCREEN_HIGHT, 0, 0);
    self.thePickerView.frame = CGRectMake(0, SCREEN_HIGHT, 0, 0);
    
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
