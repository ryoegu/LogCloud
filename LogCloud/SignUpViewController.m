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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)signUp{
    
}

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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch (textField.tag) {
        case 1:
            [[self.view viewWithTag:2] becomeFirstResponder];
            return YES;
        case 2:
            [[self.view viewWithTag:3] becomeFirstResponder];
            return NO;
        default:
            [textField resignFirstResponder];
            [self signUp];
            return YES;
    }
}
-(void)logIn{
    
}


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
@end
