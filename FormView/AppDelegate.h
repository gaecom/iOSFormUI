//
//  AppDelegate.h
//  FormView
//
//  Created by YS on 13-5-15.
//  Copyright (c) 2013年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    FormViewController *form;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FormViewController *form;

@end
