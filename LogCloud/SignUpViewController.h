//
//  SignUpViewController.h
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/11.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface SignUpViewController : UIViewController
{
    int mode;
    //mode==1 -> SignUp
    //mode==2 -> LogIn
    //実際にはLogInでユーザ名が見つからなければSignUpに切り替える
    IBOutlet UILabel *titleLabel;
    IBOutlet UITextField *userNameTextField;
    
    IBOutlet UITextField *passwordTextField;
    IBOutlet UITextField *confirmPasswordTextField;
    IBOutlet UIButton *changeButton;
}
- (IBAction)titleSet:(UIButton *)sender;
@end
