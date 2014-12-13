//
//  SignUpViewController.m
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/11.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [userNameTextField becomeFirstResponder];
    mode=1;
    userNameTextField.delegate=self;
    mailaddressTextField.delegate=self;
    passwordTextField.delegate=self;
    confirmPasswordTextField.delegate=self;

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

#pragma mark - Parse Methods

-(void)signUp{
    if([self passwordCheckingWithConfirmTextField]){
        PFUser *user = [PFUser user];
        user.username = userNameTextField.text;
        user.password = passwordTextField.text;
        user.email = mailaddressTextField.text;
        
        // other fields can be set just like with PFObject
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                NSUserDefaults *saveData = [NSUserDefaults standardUserDefaults];
                [saveData setObject:userNameTextField.text forKey:@"CALLSIGN"];
                [saveData setObject:mailaddressTextField.text forKey:@"EMAIL"];
                [saveData synchronize];
                LUKeychainAccess *keychainAccess = [LUKeychainAccess standardKeychainAccess];
                [keychainAccess setString:passwordTextField.text forKey:@"HASHED"];
                [self dismissViewControllerAnimated:YES completion:nil];
            } else {
                NSString *errorString = [error userInfo][@"error"];
                titleLabel.text = errorString;
                // Show the errorString somewhere and let the user try again.
            }
        }];
    }
}


-(void)logIn{
    
}

#pragma mark - Login Mode Set

- (IBAction)titleSet:(UIButton *)sender {
    if(mode==1){
        //ログインモードに切り替える
        mode=2;
        titleLabel.text=@"ログイン";
        [sender setTitle:@"ログイン" forState:UIControlStateNormal];
    }else if(mode==2){
        [self logIn];
    }else{
        //サインアップモードに切り替える
        mode=1;
        titleLabel.text=@"アカウントを作成します";
        mode=1;
        [sender setTitle:@"既にアカウントを持っている" forState:UIControlStateNormal];
    }
}

#pragma mark - Password confirm check
-(BOOL)passwordCheckingWithConfirmTextField{
    if([passwordTextField.text isEqualToString:confirmPasswordTextField.text]){
        return YES;
    }else{
        return NO;
    }
}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch (textField.tag) {
        case 1:
            [[self.view viewWithTag:2] becomeFirstResponder];
            return YES;
        case 2:
            [[self.view viewWithTag:3] becomeFirstResponder];
            return NO;
        case 3:
            [[self.view viewWithTag:4] becomeFirstResponder];
            return NO;
        default:
            [textField resignFirstResponder];
            if([userNameTextField.text isEqualToString:@""]){
                UIAlertView *alert =[[UIAlertView alloc]
                                     initWithTitle:@"未入力の項目があります"
                                     message:@"コールサインを入力してください。"
                                     delegate:self
                                     cancelButtonTitle:@"キャンセル"
                                     otherButtonTitles:@"OK", nil];
                
                [alert show];
                
            }else{
            [self signUp];
            }
            return YES;
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        [self signUp];
        
    }else{
        [[self.view viewWithTag:1] becomeFirstResponder];;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 該当のtextField
    if( textField==userNameTextField) {
        // deleteの時
        if( string.length == 0 ) return YES;
        
        BOOL canEdit = YES;
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"];
        for (int i = 0; i < string.length; i++)
        {
            unichar c = [string characterAtIndex:i];
            if (![myCharSet characterIsMember:c]) {
                canEdit = NO;
                
                if( 'a' <= c && c <= 'z' ) {
                    NSString *str = [[NSString stringWithFormat:@"%c", c] uppercaseString];
                    textField.text = [textField.text stringByReplacingCharactersInRange:NSMakeRange(range.location+i, 0) withString:str];
                }
            }
        }
        return canEdit;
    }else return YES;
}

#pragma mark - Background Movie
//背景動画再生用
/*
 - (void)playMovie {
 NSString *path = [[NSBundle mainBundle] pathForResource:@"welcome" ofType:@"m4v"];
 NSURL *url = [NSURL fileURLWithPath:path];
 MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:url];
 // MoviePlayerの設定
 //    player.scalingMode = MPMovieScalingModeAspectFill;
 //    player.controlStyle = MPMovieControlStyleNone;
 
 [[NSNotificationCenter defaultCenter] addObserver:self
 selector:@selector(finishPreload:)
 name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
 object:player];
 
 [[NSNotificationCenter defaultCenter] addObserver:self
 selector:@selector(finishPlayback:)
 name:MPMoviePlayerPlaybackDidFinishNotification
 object:player];
 // viewに追加
 [player.view setFrame:CGRectMake(0, 0, 320, 200)];
 [self.view addSubview:player.view];
 }
 - (void)finishPreload:(NSNotification *)aNotification {
 MPMoviePlayerController *player = [aNotification object];
 [[NSNotificationCenter defaultCenter] removeObserver:self
 name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
 object:player];
 [player play];
 }
 
 - (void)finishPlayback:(NSNotification *)aNotification {
 MPMoviePlayerController *player = [aNotification object];
 [[NSNotificationCenter defaultCenter] removeObserver:self
 name:MPMoviePlayerPlaybackDidFinishNotification
 object:player];
 [player stop];
 }
 
 */
@end
