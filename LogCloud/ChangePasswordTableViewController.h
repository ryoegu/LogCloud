//
//  ChangePasswordTableViewController.h
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/09.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <LUKeychainAccess.h>

@interface ChangePasswordTableViewController : UITableViewController<UITextFieldDelegate>
{
    UIFont *faFont;
    CGRect rect;
    
    UITextField *oldPasswordTextField;
    UITextField *newPasswordTextField;
    UITextField *confirmPasswordTextField;
}
@end
