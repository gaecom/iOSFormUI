//
//  FormViewController.m
//  FormView
//
//  Created by YS on 13-5-15.
//  Copyright (c) 2013年 YS. All rights reserved.
//

#import "FormViewController.h"

@interface FormViewController ()

@end

@implementation FormViewController

int tag = 100;

@synthesize scView,destInp,select,contInp,timeStart,timeEnd,taInp,faInp;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    // Do any additional setup after loading the view from its nib.
    self.scView = [[[UIScrollView alloc] initWithFrame:self.view.bounds] autorelease];
    //[self.scView setScrollEnabled:YES];
    [self.view addSubview:self.scView];
    [self.scView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]]];
    [self setTitle:@"首页"];
    
    //NSLog(@"%@", self.scView);
    
    //绘制Banner区
    UIView * bannerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    [bannerView setBackgroundColor:[UIColor colorWithRed:80/255.0 green:171/255.0 blue:36/255.0 alpha:1.0]];
    UIImageView *banner = [[UIImageView alloc] initWithFrame:bannerView.bounds];
    [banner setImage:[UIImage imageNamed:@"banner"]];
    [bannerView addSubview:banner];
    [bannerView.layer setMasksToBounds:YES];
    //用户信息待补充
    [self.scView addSubview:bannerView];
    
    UIView *destView = [[UIView alloc] initWithFrame:CGRectMake(0, 68, self.view.bounds.size.width, 100)];
    [destView setBackgroundColor:[UIColor clearColor]];
    [self.scView addSubview:destView];
    
    UILabel *destLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, self.view.bounds.size.width - 60, 50)];
    //[destLabel setBackgroundColor:[UIColor greenColor]];
    [destLabel setBackgroundColor:[UIColor clearColor]];
    [destLabel setTextColor:[UIColor whiteColor]];
    [destLabel setFont:[UIFont systemFontOfSize:24]];
    [destLabel setText:@"誓言目的"];
    [destView addSubview:destLabel];
    
    UIView *destInpV = [self drawInputView:CGRectMake(30, 55, self.view.bounds.size.width - 60, 40)];
    [destView addSubview:destInpV];
    CGRect destSize = destInpV.bounds;
    destSize.origin.x = 3;
    destSize.origin.y = 2;
    destSize.size.width -= 6;
    destSize.size.height -= 4;
    self.destInp = [[[UITextField alloc] initWithFrame:destSize] autorelease];
    [self.destInp setTag:tag++];
    self.destInp.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.destInp.borderStyle = UITextBorderStyleNone;
    self.destInp.returnKeyType = UIReturnKeyDone;
    [self.destInp setTextColor:[UIColor whiteColor]];
    [self.destInp setFont:[UIFont systemFontOfSize:18]];
    self.destInp.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.destInp.delegate = self;
    [destInpV addSubview:self.destInp];
    
    UIView *contView = [[UIView alloc] initWithFrame:CGRectMake(0, 165, self.view.bounds.size.width, 150)];
    [contView setBackgroundColor:[UIColor clearColor]];
    [self.scView addSubview:contView];
    
    UILabel *contLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, self.view.bounds.size.width - 60, 50)];
    [contLabel setBackgroundColor:[UIColor clearColor]];
    [contLabel setTextColor:[UIColor whiteColor]];
    [contLabel setFont:[UIFont systemFontOfSize:24]];
    [contLabel setText:@"誓言内容"];
    [contView addSubview:contLabel];
    
    UIView *contInpV = [self drawInputView:CGRectMake(30, 55, self.view.bounds.size.width - 60, 90)];
    [contView addSubview:contInpV];
    CGRect contSize = contInpV.bounds;
    contSize.origin.x = 3;
    contSize.origin.y = 2;
    contSize.size.width -= 6;
    contSize.size.height -= 4;
    self.contInp = [[[UITextView alloc] initWithFrame:contSize] autorelease];
    [self.contInp setTag:tag++];
    self.contInp.returnKeyType = UIReturnKeyDone;
    [self.contInp setBackgroundColor:[UIColor clearColor]];
    [self.contInp setTextColor:[UIColor whiteColor]];
    [self.contInp setFont:[UIFont systemFontOfSize:18]];
    self.contInp.delegate = self;
    [contInpV addSubview:self.contInp];
    
    UIView *timeView = [[UIView alloc] initWithFrame:CGRectMake(0, 315, self.view.bounds.size.width, 100)];
    [timeView setBackgroundColor:[UIColor clearColor]];
    [self.scView addSubview:timeView];
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, self.view.bounds.size.width - 60, 50)];
    [timeLabel setBackgroundColor:[UIColor clearColor]];
    [timeLabel setTextColor:[UIColor whiteColor]];
    [timeLabel setFont:[UIFont systemFontOfSize:24]];
    [timeLabel setText:@"持续时间"];
    [timeView addSubview:timeLabel];
    
    UILabel *timeTextLabel = [[[UILabel alloc] initWithFrame:CGRectMake(timeView.bounds.size.width / 2 - 20, 55, 40, 40)] autorelease];
    [timeTextLabel setTextAlignment:NSTextAlignmentCenter];
    [timeTextLabel setText:@"到"];
    [timeTextLabel setFont:[UIFont systemFontOfSize:18]];
    [timeTextLabel setTextColor:[UIColor whiteColor]];
    [timeTextLabel setBackgroundColor:[UIColor clearColor]];
    [timeView addSubview:timeTextLabel];
    
    int timeW = (self.view.bounds.size.width - 60 - timeTextLabel.bounds.size.width) / 2;
    UIView *timeStartView = [self drawInputView:CGRectMake(30, 55, timeW, 40)];
    UIView *timeEndView = [self drawInputView:CGRectMake(timeView.bounds.size.width - 30 - timeW, 55, timeW, 40)];
    [timeView addSubview:timeStartView];
    [timeView addSubview:timeEndView];
    CGRect timeSize = timeStartView.bounds;
    timeSize.origin.x = 3;
    timeSize.origin.y = 2;
    timeSize.size.width -= 6;
    timeSize.size.height -= 4;
    self.timeStart = [[[UITextField alloc] initWithFrame:timeSize] autorelease];
    self.timeEnd = [[[UITextField alloc] initWithFrame:timeSize] autorelease];
    [self.timeStart setTag:tag++];
    [self.timeEnd setTag:tag++];
    self.timeStart.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.timeStart.borderStyle = UITextBorderStyleNone;
    self.timeStart.returnKeyType = UIReturnKeyDone;
    [self.timeStart setTextColor:[UIColor whiteColor]];
    [self.timeStart setFont:[UIFont systemFontOfSize:18]];
    self.timeStart.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.timeStart.delegate = self;
    self.timeEnd.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.timeEnd.borderStyle = UITextBorderStyleNone;
    self.timeEnd.returnKeyType = UIReturnKeyDone;
    [self.timeEnd setTextColor:[UIColor whiteColor]];
    [self.timeEnd setFont:[UIFont systemFontOfSize:18]];
    self.timeEnd.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.timeEnd.delegate = self;
    [timeStartView addSubview:self.timeStart];
    [timeEndView addSubview:self.timeEnd];
    
    UIView *taView = [[UIView alloc] initWithFrame:CGRectMake(0, 415, self.view.bounds.size.width, 100)];
    [taView setBackgroundColor:[UIColor clearColor]];
    [self.scView addSubview:taView];
    
    UILabel *taLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, self.view.bounds.size.width - 60, 50)];
    [taLabel setBackgroundColor:[UIColor clearColor]];
    [taLabel setTextColor:[UIColor whiteColor]];
    [taLabel setFont:[UIFont systemFontOfSize:24]];
    [taLabel setText:@"请TA监督"];
    [taView addSubview:taLabel];
    
    UIView *taInpView = [self drawInputView:CGRectMake(30, 55, taView.bounds.size.width - 30 - 190, 40)];
    [taView addSubview:taInpView];
    CGRect taSize = taInpView.bounds;
    taSize.origin.x = 3;
    taSize.origin.y = 2;
    taSize.size.width -= 6;
    taSize.size.height -= 4;
    self.taInp = [[[UITextField alloc] initWithFrame:taSize] autorelease];
    [self.taInp setTag:tag++];
    self.taInp.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.taInp.borderStyle = UITextBorderStyleNone;
    self.taInp.returnKeyType = UIReturnKeyDone;
    [self.taInp setTextColor:[UIColor whiteColor]];
    [self.taInp setFont:[UIFont systemFontOfSize:18]];
    self.taInp.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.taInp.delegate = self;
    [taInpView addSubview:self.taInp];
    UIView *selectView = [self drawButtonView:CGRectMake(taView.bounds.size.width - 30 - 150, 55, 150, 40)
                                  colorFrom:[UIColor colorWithRed:120/255.0 green:212/255.0 blue:75/255.0 alpha:1.0]
                                    colorTo:[UIColor colorWithRed:50/255.0 green:121/255.0 blue:13/255.0 alpha:1.0]
                                borderColor:[UIColor colorWithRed:39/255.0 green:125/255.0 blue:0.0 alpha:1.0]
                             highlightColor:@[
                                (id)[UIColor colorWithRed:185/255.0 green:255/255.0 blue:152/255.0 alpha:1.0].CGColor,
                                (id)[UIColor colorWithRed:185/255.0 green:255/255.0 blue:152/255.0 alpha:0.01].CGColor
                                ]
                        ];
    self.select = [[[UIButton alloc] initWithFrame:selectView.bounds] autorelease];
    [self.select setTitle:@"从微博好友中选" forState:UIControlStateNormal];
    [self.select addTarget:self action:@selector(saveData) forControlEvents:UIControlEventTouchUpInside];
    [selectView addSubview:self.select];
    [taView addSubview:selectView];
    
    UIView *faView = [[UIView alloc] initWithFrame:CGRectMake(0, 515, self.view.bounds.size.width, 100)];
    [faView setBackgroundColor:[UIColor clearColor]];
    [self.scView addSubview:faView];
    
    UILabel *faLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, self.view.bounds.size.width - 60, 50)];
    [faLabel setBackgroundColor:[UIColor clearColor]];
    [faLabel setTextColor:[UIColor whiteColor]];
    [faLabel setFont:[UIFont systemFontOfSize:24]];
    [faLabel setText:@"违誓惩罚"];
    [faView addSubview:faLabel];
    
    UIView *faInpView = [self drawInputView:CGRectMake(30, 55, faView.bounds.size.width - 60, 40)];
    [faView addSubview:faInpView];
    CGRect faSize = faInpView.bounds;
    faSize.origin.x = 3;
    faSize.origin.y = 2;
    faSize.size.width -= 6;
    faSize.size.height -= 4;
    self.faInp = [[[UITextField alloc] initWithFrame:faSize] autorelease];
    [self.faInp setTag:tag++];
    self.faInp.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.faInp.borderStyle = UITextBorderStyleNone;
    self.faInp.returnKeyType = UIReturnKeyDone;
    [self.faInp setTextColor:[UIColor whiteColor]];
    [self.faInp setFont:[UIFont systemFontOfSize:18]];
    self.faInp.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.faInp.delegate = self;
    [faInpView addSubview:self.faInp];
    
    UIImageView *faSan = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sanjiao"]] autorelease];
    [faSan setFrame:CGRectMake(faInpView.bounds.size.width - 29, 14, 19, 12)];
    [faSan setBackgroundColor:[UIColor clearColor]];
    [faInpView addSubview:faSan];
    
    [self.scView setContentSize:CGSizeMake(self.view.bounds.size.width, faView.frame.origin.y + faView.frame.size.height + 200)];
}

#pragma mark - 自定义方法

- (UIView *) drawInputView:(CGRect)rect {
    UIView *nv = [[[UIView alloc] initWithFrame:rect] autorelease];
    CALayer *layer = [nv layer];
    [nv setBackgroundColor:[UIColor colorWithRed:219/255.0 green:255/255.0 blue:202/255.0 alpha:0.15]];
    
    layer.cornerRadius = 5.0;
    layer.masksToBounds = YES;
    
    CAGradientLayer *topGradientLayer = [[[CAGradientLayer alloc] init] autorelease];
    CGRect toprect = nv.bounds;
    toprect.size.height = 3;
    [topGradientLayer setFrame:toprect];
    topGradientLayer.colors = @[
                                (id)[[UIColor colorWithRed:39/255.0 green:123/255.0 blue:15/255.0 alpha:0.75] CGColor],
                                (id)[[UIColor colorWithRed:39/255.0 green:123/255.0 blue:15/255.0 alpha:0.01] CGColor]
                                ];
    topGradientLayer.startPoint = CGPointMake(0.0, 0.0);
    topGradientLayer.endPoint = CGPointMake(0, 1);
    
    CAGradientLayer *rightGradientLayer = [[[CAGradientLayer alloc] init] autorelease];
    CGRect rightrect = nv.bounds;
    rightrect.origin.x = rightrect.size.width - 2;
    rightrect.size.width = 2;
    [rightGradientLayer setFrame:rightrect];
    rightGradientLayer.colors = @[
                                  (id)[[UIColor colorWithRed:39/255.0 green:123/255.0 blue:15/255.0 alpha:0.01] CGColor],
                                  (id)[[UIColor colorWithRed:39/255.0 green:123/255.0 blue:15/255.0 alpha:0.75] CGColor]
                                  ];
    rightGradientLayer.startPoint = CGPointMake(0.0, 0.0);
    rightGradientLayer.endPoint = CGPointMake(1, 0);
    
    CAGradientLayer *leftGradientLayer = [[[CAGradientLayer alloc] init] autorelease];
    CGRect leftrect = nv.bounds;
    leftrect.size.width = 2;
    [leftGradientLayer setFrame:leftrect];
    leftGradientLayer.colors = @[
                                 (id)[[UIColor colorWithRed:166/255.0 green:218/255.0 blue:142/255.0 alpha:0.75] CGColor],
                                 (id)[[UIColor colorWithRed:166/255.0 green:218/255.0 blue:142/255.0 alpha:0.01] CGColor]
                                 ];
    leftGradientLayer.startPoint = CGPointMake(0.0, 0.0);
    leftGradientLayer.endPoint = CGPointMake(1, 0);
    
    CAGradientLayer *bottomGradientLayer = [[[CAGradientLayer alloc] init] autorelease];
    CGRect bottomrect = nv.bounds;
    bottomrect.origin.y = bottomrect.size.height - 3;
    bottomrect.size.height = 3;
    [bottomGradientLayer setFrame:bottomrect];
    bottomGradientLayer.colors = @[
                                   (id)[[UIColor colorWithRed:166/255.0 green:218/255.0 blue:142/255.0 alpha:0.01] CGColor],
                                   (id)[[UIColor colorWithRed:166/255.0 green:218/255.0 blue:142/255.0 alpha:0.75] CGColor]
                                   ];
    bottomGradientLayer.startPoint = CGPointMake(0.0, 0.0);
    bottomGradientLayer.endPoint = CGPointMake(0, 1);
    
    [layer addSublayer:topGradientLayer];
    [layer addSublayer:rightGradientLayer];
    [layer addSublayer:leftGradientLayer];
    [layer addSublayer:bottomGradientLayer];
    
    return nv;
}

- (UIView *) drawButtonView:(CGRect)rect colorFrom:(UIColor *)fc colorTo:(UIColor *) tc borderColor:(UIColor *)bc highlightColor:(NSArray *)hcs {
    UIView *bvw = [[[UIView alloc] initWithFrame:rect] autorelease];
    [bvw setBackgroundColor:[UIColor redColor]];
    bvw.layer.borderColor = bc.CGColor;
    bvw.layer.cornerRadius = 5.0f;
    bvw.layer.borderWidth = 1.0;
    bvw.layer.shadowColor = [UIColor colorWithRed:39/255.0 green:125/255.0 blue:0.0 alpha:1.0].CGColor;
    bvw.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    bvw.layer.shadowRadius = 0.0f;
    bvw.layer.masksToBounds = YES;
    
    CAGradientLayer *cal = [[[CAGradientLayer alloc] init] autorelease];
    [cal setFrame:bvw.bounds];
    cal.colors = @[
                   (id)fc.CGColor,
                   (id)tc.CGColor
                   ];
    cal.startPoint = CGPointMake(0.0, 0.0);
    cal.endPoint = CGPointMake(0.0, 1.0);
    
    CAGradientLayer *hcc = [[[CAGradientLayer alloc] init] autorelease];
    CGRect hcf = bvw.bounds;
    hcf.size.height = 5;
    [hcc setFrame:hcf];
    hcc.colors = hcs;
    hcc.startPoint = CGPointMake(0.0, 0.0);
    hcc.endPoint = CGPointMake(0.0, 1.0);
    
    [bvw.layer addSublayer:cal];
    [bvw.layer addSublayer:hcc];
    
    return bvw;
}

#pragma mark - Button Action

- (void)saveData {
    NSLog(@"%@", self.destInp.text);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 键盘代理实现

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

/*
int prevTag;
float prevMoveY;
- (void) textFieldDidBeginEditing:(UITextField *)textField {
    CGRect textFrame = textField.frame;
    float textY = textFrame.origin.y + textFrame.size.height;
    float bottomY = self.view.frame.size.height - textY;
    if(bottomY >= 216){
        prevTag = -1;
        return;
    }
    
    prevTag = textField.tag;
    float moveY = 216 - bottomY;
    prevMoveY = moveY;
    
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    frame.origin.y -= moveY;
    frame.size.height += moveY;
    self.view.frame = frame;
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    if(prevTag == -1){
        return;
    }
    float moveY;
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    if(prevTag == textField.tag){
        moveY = prevMoveY;
        frame.origin.y += moveY;
        frame.size.height -= moveY;
        self.view.frame = frame;
    }
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
    [textField resignFirstResponder];
}*/

@end
