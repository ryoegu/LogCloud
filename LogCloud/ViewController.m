//
//  ViewController.m
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/07.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //UINavigationBarにButtonを追加
    /*
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"userImageLittle.png"]];
    imageView.frame = CGRectMake(0, 0, 35, 35);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.userInteractionEnabled = YES;
    [[imageView layer]setCornerRadius:17.5];
    [imageView setClipsToBounds:YES];
    
    */
    UIButton *imageView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    [imageView setBackgroundImage:[UIImage imageNamed:@"userImageLittle.png"]
                          forState:UIControlStateNormal];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.layer.cornerRadius=17.5f;
    [imageView setClipsToBounds:YES];
    [imageView addTarget:self action:@selector(toSettingView:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:imageView];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    /*barButtonItem.target=self;
    barButtonItem.action=@selector(toSettingView:);
    */
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //ログイン情報をUserDefaults・キーチェーンから読み出し
    LUKeychainAccess *keychainAccess=[LUKeychainAccess standardKeychainAccess];
    saveData = [NSUserDefaults standardUserDefaults];
    callsign = [saveData stringForKey:@"CALLSIGN"];
    if(callsign ==nil){
        [self performSegueWithIdentifier:@"toSignUpScreen" sender:self];
    }else{
        [PFUser logInWithUsernameInBackground:callsign
                                     password:[keychainAccess stringForKey:@"HASHED"]
                                        block:^(PFUser *user, NSError *error) {
                                            if (user) {
                                                NSLog(@"Login Succeeded\ncallsign:%@",callsign);
                                            } else {
                                                NSLog(@"%@",error);
                                            }
                                        }];
    }
    /*
     PFUser *currentUser = [PFUser currentUser];
     if (currentUser) {
     // do stuff with the user
     } else {
     [self performSegueWithIdentifier:@"toSignUpScreen" sender:self];
     
     }
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

-(void)updateCell{
    
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }

-(void)toSettingView:(id)sender{
    NSLog(@"Entered");
    [self performSegueWithIdentifier:@"toSettingView" sender:self];
}



@end
