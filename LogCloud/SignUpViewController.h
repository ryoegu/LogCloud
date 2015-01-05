//
//  SignUpViewController.h
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/11.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <LUKeychainAccess.h>
#import <MediaPlayer/MediaPlayer.h>

@interface SignUpViewController : UIViewController<UITextFieldDelegate>
{
    int mode;
    //mode==1 -> SignUp
    //mode==2 -> LogIn
    //実際にはLogInでユーザ名が見つからなければSignUpに切り替える
    IBOutlet UILabel *titleLabel;
    IBOutlet UITextField *userNameTextField;
    
    IBOutlet UITextField *mailaddressTextField;
    IBOutlet UITextField *passwordTextField;
    IBOutlet UIButton *changeButton;
}
- (IBAction)titleSet:(UIButton *)sender;
-(BOOL)passwordCheckingWithConfirmTextField;
@end
