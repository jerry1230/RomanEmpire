//
//  RectProgressVC.m
//  RomanEmpire
//
//  Created by Flying on 2018/6/20.
//  Copyright © 2018年 Flyingbird. All rights reserved.
//

#import "RectProgressVC.h"

@interface RectProgressVC ()
{
    NSTimer *_timer;
}
@property (weak, nonatomic) IBOutlet UIView *rectView;
@property (weak, nonatomic) IBOutlet UIProgressView *grogressView;
@property (weak, nonatomic) IBOutlet UISlider *grogressSlider;
@property (assign, nonatomic) float curProgress;

@property (strong, nonatomic) UIBezierPath * circlePath;
@property (strong, nonatomic) CAShapeLayer * shapeLayer;

- (IBAction)sliderValueChanged:(id)sender;

@end

@implementation RectProgressVC

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.rectView.layer.cornerRadius = 10;
//    self.rectView.clipsToBounds = YES;
//    self.circlePath = [UIBezierPath bezierPathWithRoundedRect:self.rectView.bounds cornerRadius:10];
//    [self.circlePath moveToPoint:CGPointMake(self.rectView.frame.size.width/2, 0)];
//
////    [self.circle addLineToPoint:CGPointMake(200, 150)];//添加绘制点subPath
////
////    [self.circle addLineToPoint:CGPointMake(300, 10)]; //添加绘制点subPath
////
////    [self.circle closePath]; //此句可以连接起点和最后一个绘制点
////
////    [self.circle stroke]; //这句是最关键的，将path绘制出来，如果不写这句，路线将不会绘制出来
//
//
//
//
//    self.shapeLayer = [CAShapeLayer layer];
//    self.shapeLayer.fillColor = [UIColor lightGrayColor].CGColor;
//    [self.rectView.layer addSublayer:_shapeLayer];
////    [self circleDraw];
//// Do any additional setup after loading the view from its nib.
//}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self circleBezierPath];
    //用定时器模拟数值输入的情况
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                              target:self
                                            selector:@selector(circleAnimationTypeOne)
                                            userInfo:nil
                                             repeats:YES];
}

-(void)circleBezierPath
{
    //创建出CAShapeLayer
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 0, 150, 150);
    self.shapeLayer.position = self.view.center;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    //设置线条的宽度和颜色
    self.shapeLayer.lineWidth = 2.0f;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    //设置stroke起始点
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0;
    
    //创建出圆形贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 150)];
    
    //让贝塞尔曲线与CAShapeLayer产生联系
    self.shapeLayer.path = circlePath.CGPath;
    
    //添加并显示
    [self.view.layer addSublayer:self.shapeLayer];
}

- (void)circleAnimationTypeOne
{
    if (self.shapeLayer.strokeEnd > 1 && self.shapeLayer.strokeStart < 1) {
        self.shapeLayer.strokeStart += 0.1;
    }else if(self.shapeLayer.strokeStart == 0){
        self.shapeLayer.strokeEnd += 0.1;
    }
    
    if (self.shapeLayer.strokeEnd == 0) {
        self.shapeLayer.strokeStart = 0;
    }
    
    if (self.shapeLayer.strokeStart == self.shapeLayer.strokeEnd) {
        self.shapeLayer.strokeEnd = 0;
    }
    NSLog(@"strokeStart = %f;strokeEnd = %f",self.shapeLayer.strokeStart,self.shapeLayer.strokeEnd);
}

- (void)circleAnimationTypeTwo
{
    CGFloat valueOne = arc4random() % 100 / 100.0f;
    CGFloat valueTwo = arc4random() % 100 / 100.0f;
    
    self.shapeLayer.strokeStart = valueOne < valueTwo ? valueOne : valueTwo;
    self.shapeLayer.strokeEnd = valueTwo > valueOne ? valueTwo : valueOne;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderValueChanged:(id)sender {
//    圆角矩形
    [self circleDraw];
    
}

//fileprivate func hollowLayer(){
//    //        创建空心的layer
//    let hollowLayer = CAShapeLayer()
//    hollowLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//    view.layer.addSublayer(hollowLayer)
//    hollowLayer.position = view.center
//
//    //        最外面待圆角的方形path
//    let squarePath = UIBezierPath.init(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerRadius: 5)
//    //        中间镂空的圆形path
//    let hollowPath = UIBezierPath.init(ovalIn: CGRect(x: 10, y: 10, width: 80, height: 80))
//
//    squarePath.append(hollowPath)
//    hollowLayer.path = squarePath.cgPath
//
//    hollowLayer.fillColor = UIColor.lightGray.cgColor
//    //        设置路径的填充模式为两个图形的非交集
//    hollowLayer.fillRule = kCAFillRuleEvenOdd
//
//
//
//    //        创建进度layer
//    let processSectorLayer = CAShapeLayer()
//    view.layer.addSublayer(processSectorLayer)
//    processSectorLayer.bounds = CGRect(x: 0, y: 0, width: 70, height: 70)
//    processSectorLayer.position = view.center
//
//    //        进度的path
//    let processSectorPath = UIBezierPath.init(arcCenter: CGPoint.init(x: 35, y: 35), radius: 17.5, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
//
//
//    processSectorLayer.path = processSectorPath.cgPath
//
//    processSectorLayer.lineWidth = 35
//
//    //        进度的起点和结束位置，设置进度条修改这个值和结束数值就可以了
//    processSectorLayer.strokeStart = 0.5
//    processSectorLayer.strokeEnd = 0.75
//
//    processSectorLayer.strokeColor = UIColor.lightGray.cgColor
//
//    processSectorLayer.fillColor = UIColor.clear.cgColor
//}

- (void)circleDraw
{
//    CABasicAnimation *strokeAnim = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
//    strokeAnim.fromValue         = (id) [UIColor blackColor].CGColor;
//    strokeAnim.toValue           = (id) [UIColor purpleColor].CGColor;
//    strokeAnim.duration          = 1.0;
//    strokeAnim.repeatCount       = 0.0;
//    strokeAnim.autoreverses      = NO;
//    [shapeLayer addAnimation:strokeAnim forKey:@"animateStrokeColor"];
//
//
//    UIBezierPath * circle = [UIBezierPath bezierPathWithOvalInRect:self.rectView.bounds];


//    UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:self.rectView.center radius:360 startAngle:3.1415926 *3/2 endAngle:3.1415926 *3/2 clockwise:YES];


//    shapeLayer.strokeStart = 0.125;

    
    
    _shapeLayer.strokeStart = 0.125;
//    _shapeLayer.strokeEnd = self.grogressSlider.value;
    
    _shapeLayer.strokeEnd = self.grogressSlider.value+0.125;
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    _shapeLayer.lineWidth = 8.f;
//    if ((self.grogressSlider.value+0.125) > 1) {
//        _shapeLayer.strokeEnd = (self.grogressSlider.value + 0.125 - 1);
//    }else
//    {
//    }
    _shapeLayer.path = self.circlePath.CGPath;
    [self.circlePath fill];

//    self.curProgress = self.grogressSlider.value;
    
//    CABasicAnimation *strokeAnim = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
//    strokeAnim.fromValue         = (id) [UIColor lightGrayColor].CGColor;
//    strokeAnim.toValue           = (id) [UIColor redColor].CGColor;
//    strokeAnim.duration          = 3.0;
//    strokeAnim.repeatCount       = 0;
////    strokeAnim.autoreverses      = YES;
//    [shapeLayer addAnimation:strokeAnim forKey:@"animateStrokeColor"];
}

/*
- (UIImage *)drawRectWithCorderRadius:(CGFloat)radius
                          borderWidth:(CGFloat)bWidth
                          borderColor:(UIColor *)borderColor
                          progress:(float)progressValue
{
    CGSize sizeFit = CGSizeMake(self.rectView.frame.size.width, self.rectView.frame.size.height);
    UIGraphicsBeginImageContextWithOptions(sizeFit, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, bWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGFloat width = sizeFit.width;
    CGFloat height = sizeFit.height;
    
    switch (progressValue) {
        case <#constant#>:
            <#statements#>
            break;
            
        default:
            break;
    }
    
    
    
    CGContextMoveToPoint(context, width - bWidth, radius + bWidth);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, width - bWidth, height - bWidth, width - radius - bWidth, height - bWidth, radius);  // 右下角角度
    CGContextAddArcToPoint(context, bWidth, height - bWidth, bWidth, height - radius - bWidth, radius); // 左下角角度
    CGContextAddArcToPoint(context, bWidth, bWidth, width - bWidth, bWidth, radius); // 左上角
    CGContextAddArcToPoint(context, width - bWidth, bWidth, width - bWidth, radius + bWidth, radius); // 右上角
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathEOFillStroke);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}




- (UIImage *)drawRectWithCorderRadius:(CGFloat)radius
                          borderWidth:(CGFloat)bWidth
                          borderColor:(UIColor *)bColor
                              bgColor:(UIColor *)bgColor
{
    CGSize sizeFit = CGSizeMake(self.rectView.frame.size.width, self.rectView.frame.size.height);
    UIGraphicsBeginImageContextWithOptions(sizeFit, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, bWidth);
    CGContextSetStrokeColorWithColor(context, bColor.CGColor);
    CGContextSetFillColorWithColor(context, bgColor.CGColor);
    
    CGFloat width = sizeFit.width;
    CGFloat height = sizeFit.height;
    CGContextMoveToPoint(context, width - bWidth, radius + bWidth);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, width - bWidth, height - bWidth, width - radius - bWidth, height - bWidth, radius);  // 右下角角度
    CGContextAddArcToPoint(context, bWidth, height - bWidth, bWidth, height - radius - bWidth, radius); // 左下角角度
    CGContextAddArcToPoint(context, bWidth, bWidth, width - bWidth, bWidth, radius); // 左上角
    CGContextAddArcToPoint(context, width - bWidth, bWidth, width - bWidth, radius + bWidth, radius); // 右上角
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathEOFillStroke);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}
*/
@end
