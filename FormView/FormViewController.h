//
//  FormViewController.h
//  FormView
//
//  Created by YS on 13-5-15.
//  Copyright (c) 2013年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface FormViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
{
    UIScrollView *scView;
    UITextField *destInp;
    UITextView *contInp;
    UITextField *timeStart;
    UITextField *timeEnd;
    UITextField *taInp;
    UITextField *faInp;
    UIButton *select;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scView;
@property (strong, nonatomic) IBOutlet UITextField *destInp;
@property (strong, nonatomic) IBOutlet UITextView *contInp;
@property (strong, nonatomic) IBOutlet UITextField *timeStart;
@property (strong, nonatomic) IBOutlet UITextField *timeEnd;
@property (strong, nonatomic) IBOutlet UITextField *taInp;
@property (strong, nonatomic) IBOutlet UITextField *faInp;
@property (strong, nonatomic) IBOutlet UIButton *select;

@end
