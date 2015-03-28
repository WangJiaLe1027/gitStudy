//
//  ViewController.m
//  gitStudy
//
//  Created by wangjiale on 15/3/26.
//  Copyright (c) 2015年 wangjiale. All rights reserved.
//

#import "ViewController.h"

#import "nextViewController.h"
#import "ColorCircle.h"
#import "ColorCircle.h"
#import  <CoreGraphics/CoreGraphics.h>

//#import "MCFireworksButton.h"
//#import "MCFireworksView.h"

@interface ViewController ()

//@property (strong, nonatomic) CAEmitterLayer *explosionLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CGRect theMainScreen = [[UIScreen mainScreen] bounds];
    ColorCircle *newCircle = [[ColorCircle alloc] initWithFrame:CGRectMake(theMainScreen.size.width * 0.191 , 100, theMainScreen.size.width * 0.618, theMainScreen.size.width *0.618)];
    newCircle.radius = 10;
    newCircle.strokeColor = [UIColor yellowColor];
    [self.view addSubview:newCircle];
    
    CAEmitterCell *snow = [CAEmitterCell emitterCell];
    //粒子名.你可以给你的cell取一个名字，用来在之后的时间里查找和修改它的属性。
    snow.name = @"snow1";
    //粒子每秒出生个数，默认为0;
    snow.birthRate = 2000.0;
    //粒子生命周期（秒）
    snow.lifetime = 3.0;
    //粒子生命周期（lifetime-lifetimeRange,lifetime+lifetimeRange）
    //snow.lifetimeRange = 1.0;
    //
    //snow.emissionLatitude = 1.0;
    //snow.emissionLongitude = 1.0;
    //
    //snow.emissionRange = 1.0;
    //速度（速度范围+-） 每秒移动像素数
    snow.velocity = 100.0;
    snow.velocityRange = 100.0;
    //
    //snow.xAcceleration = 1000.0;
    //snow.yAcceleration = -10000.0;
    //snow.zAcceleration = 1000.0;
    //
    snow.scale = 0.05;
    snow.scaleRange = 0.3;
    //snow.scaleSpeed = 0.00001;
    //
    //snow.spin = 10;
    //snow.spinRange = 0.1;
    //CGColor
    snow.color = [[UIColor colorWithRed:0 green:0 blue:0 alpha:1.000] CGColor];
    //snow.color = [];
    //
    //snow.redSpeed = 10.0;
    //snow.greenSpeed = 10.0;
    //snow.blueSpeed = 10.0;
    //snow.alphaSpeed = 10.0;
    //
    //snow.redRange = 255.0;
    //snow.greenRange = 255.0;
    //snow.blueRange = 255.0;
    //snow.alphaRange = 0.8;
    //
    snow.contents = (id)[[UIImage imageNamed:@"Sparkle"] CGImage];;
    //snow.contentsRect = CGRectMake(100, 100, 10, 10);
    //snow.style =
    
    
    
    
    CAEmitterLayer *snowLayer = [CAEmitterLayer layer];
    //发射源的形状
    //kCAEmitterLayerPoint;
    //kCAEmitterLayerLine;
    //kCAEmitterLayerRectangle;
    //kCAEmitterLayerCuboid;
    //kCAEmitterLayerCircle;
    //kCAEmitterLayerSphere;
    snowLayer.emitterShape = kCAEmitterLayerCircle;
    //渲染模式
    //kCAEmitterLayerUnordered;
    //kCAEmitterLayerOldestFirst;
    //kCAEmitterLayerOldestLast;
    //kCAEmitterLayerBackToFront;
    //kCAEmitterLayerAdditive;
    //snowLayer.renderMode = kCAEmitterLayerAdditive;
    
    //发射模式
    //kCAEmitterLayerPoints;
    //kCAEmitterLayerOutline;
    //kCAEmitterLayerSurface;
    //kCAEmitterLayerVolume;
    snowLayer.emitterMode = kCAEmitterLayerOutline;
    
    //发射源位置
    snowLayer.emitterPosition = CGPointMake(theMainScreen.size.width * 0.618 / 2 + theMainScreen.size.width * 0.191 , 100 + theMainScreen.size.width * 0.618 /2);
    //发射源的尺寸大小
    snowLayer.emitterSize = CGSizeMake(theMainScreen.size.width * 0.618, theMainScreen.size.width *0.618);
    //snowLayer.emitterSize = CGSizeMake(0.618 * theMainScreen.size.width , 0.618 * theMainScreen.size.width);
    //snowLayer.velocity = 10;
    //snowLayer.spin = 100;
    //snowLayer.lifetime = 1;
    snowLayer.emitterCells = @[snow];
    
    snowLayer.emitterCells = [NSArray arrayWithObjects:snow,nil];
    [self.view.layer insertSublayer:snowLayer atIndex:0];
     
    
    
    
    
    
    
    
    
/*
    // Do any additional setup after loading the view.
    CGRect theMainScreen = [[UIScreen mainScreen] bounds];
    ColorCircle *newCircle = [[ColorCircle alloc] initWithFrame:CGRectMake(theMainScreen.size.width * 0.191 , 100, theMainScreen.size.width * 0.618, theMainScreen.size.width *0.618)];
    newCircle.radius = 10;
    newCircle.strokeColor = [UIColor yellowColor];
    [self.view addSubview:newCircle];
    
    
    //创建雪花类型的粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    //粒子的名字
    snowflake.name = @"snow";
    //粒子每秒创造的个数
    snowflake.birthRate = 0;
    //大多数粒子的存在时间
    snowflake.alphaRange = 0.4;
    snowflake.alphaSpeed = 0.2;
    snowflake.lifetime = 0.5;
    //少部分粒子的存在时间是lifetime到lifetimeRange
    snowflake.lifetimeRange = 10;
    //粒子速度
    snowflake.velocity =40.0;
    //粒子的速度范围
    snowflake.velocityRange = 10.0;
    //粒子y方向的加速度分量
    //snowflake.yAcceleration = 2;
    //周围发射角度
    //snowflake.emissionRange = 180;
    //子旋转角度范围
    //snowflake.spinRange = 360;
    
    //缩放比例
    snowflake.scale = 0.1;
    snowflake.contents = (id)[[UIImage imageNamed:@"Sparkle"] CGImage];
    //设置雪花形状的粒子的颜色
    //snowflake.color = [[UIColor colorWithRed:0.200 green:0.258 blue:0.543 alpha:1.000] CGColor];
    
    
    
    //snowEmitter.shadowOpacity = 1.0;
    //snowEmitter.shadowRadius = 0.0;
    //snowEmitter.shadowOffset = CGSizeMake(0.0, 1.0);
    //粒子边缘的颜色
    //snowEmitter.shadowColor = [[UIColor redColor] CGColor];
     CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    
    //发射源的形状
    snowEmitter.emitterShape = kCAEmitterLayerCircle;
    //发射模式
    snowEmitter.emitterMode = kCAEmitterLayerOutline;
    //发射源位置
    snowEmitter.emitterPosition = CGPointMake(theMainScreen.size.width /2 , 100 + 0.618 * theMainScreen.size.width / 2);
    //发射源的尺寸大小
    snowEmitter.emitterSize = CGSizeMake(0.618 * theMainScreen.size.width , 0.618 * theMainScreen.size.width);
    snowEmitter.emitterCells = @[snowflake];
    //snowEmitter.emitterCells = [NSArray arrayWithObjects:snowflake,nil];
    
    [self.view.layer insertSublayer:snowEmitter atIndex:0];
    //[self.view.layer addSublayer:snowEmitter];
    
 
    CAEmitterCell *explosionCell = [CAEmitterCell emitterCell];
    explosionCell.name = @"explosion";
    explosionCell.alphaRange = 0.20;
    explosionCell.alphaSpeed = -1.0;
    
    explosionCell.lifetime = 0.7;
    explosionCell.lifetimeRange = 0.3;
    explosionCell.birthRate = 0;
    explosionCell.velocity = 40.00;
    explosionCell.velocityRange = 10.00;
    
    _explosionLayer = [CAEmitterLayer layer];
    _explosionLayer.name = @"emitterLayer";
    _explosionLayer.emitterShape = kCAEmitterLayerCircle;
    _explosionLayer.emitterMode = kCAEmitterLayerOutline;
    _explosionLayer.emitterSize = CGSizeMake(250, 0);
    _explosionLayer.emitterCells = @[explosionCell];
    _explosionLayer.renderMode = kCAEmitterLayerOldestFirst;
    _explosionLayer.masksToBounds = NO;
    _explosionLayer.seed = 1366128504;
    explosionCell.emitterCells = [NSArray arrayWithObjects:explosionCell, nil];
    [self.view.layer addSublayer:_explosionLayer];
     
     */
    //self.snowEmitter.beginTime = CACurrentMediaTime();
    //[snowEmitter setValue:@50000 forKeyPath:@"emitterCells.snowflake.birthRate"];
    //[self.snowEmitter performSelector:@selector(stop) withObject:nil afterDelay:0.1];
    

    
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
+ (Class)layerClass{
    return [CAEmitterLayer class];
}

@end
