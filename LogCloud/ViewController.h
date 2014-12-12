//
//  ViewController.h
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/07.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "LUKeychainAccess.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSUserDefaults *saveData;
    NSString *callsign;
}

@end

