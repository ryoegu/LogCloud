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

#pragma mark - View Load Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //KIProgressView
    [self makeKIProgressView];
    //UINavigationBarにButtonを追加
    //CGRect
    rect = [[UIScreen mainScreen] bounds];
    
    UIButton *imageView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    [imageView setBackgroundImage:[UIImage imageNamed:@"userImageLittle.png"]
                          forState:UIControlStateNormal];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.layer.cornerRadius=17.5f;
    [imageView setClipsToBounds:YES];
    [imageView addTarget:self action:@selector(toSettingView:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:imageView];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    /*addButton*/
    UIButton *addButton = [[UIButton alloc]initWithFrame:CGRectMake(rect.size.width/2-25, rect.size.height-100, 50, 50)];
    [addButton setBackgroundImage:[UIImage imageNamed:@"addImage.png"] forState:UIControlStateNormal];
    //影用のview
    UIView *shadow = [[UIView alloc] initWithFrame:addButton.frame];
    shadow.backgroundColor = [UIColor grayColor];
    shadow.layer.shadowOpacity = 0.3f;
    shadow.layer.shadowOffset = CGSizeMake(0, 2);
    shadow.layer.cornerRadius = 25.f;
    shadow.alpha=0.7f;
    [self.view addSubview:shadow];
    
    [addButton addTarget:self action:@selector(toAddLogView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    addButton.layer.cornerRadius = 25.f;//角丸用
    addButton.layer.masksToBounds = YES;//角丸用
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //ログイン情報をUserDefaults・キーチェーンから読み出し
    [[KIProgressViewManager manager] showProgressOnView:self.view];
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
                                                [[KIProgressViewManager manager] hideProgressView];
                                            } else {
                                                NSLog(@"%@",error);
                                            }
                                        }];
    }
  
}

#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }

#pragma mark - KIProgressView

- (void)makeKIProgressView
{
    [[KIProgressViewManager manager] setPosition:KIProgressViewPositionBottom];
    // Set the color
    [[KIProgressViewManager manager] setColor:[UIColor greenColor]];
    
    // Set the gradient
    [[KIProgressViewManager manager] setGradientStartColor:[UIColor blackColor]];
    [[KIProgressViewManager manager] setGradientEndColor:[UIColor whiteColor]];
    
    // Currently not supported
    [[KIProgressViewManager manager] setStyle:KIProgressViewStyleRepeated];
}

#pragma mark - Segue Methods
-(void)toSettingView:(id)sender{
    NSLog(@"Entered");
    [self performSegueWithIdentifier:@"toSettingView" sender:self];
}
-(void)toAddLogView:(id)sender{
    [self performSegueWithIdentifier:@"toAddLogView" sender:self];
}

#pragma mark - MemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
