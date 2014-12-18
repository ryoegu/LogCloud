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
#import <QuartzCore/QuartzCore.h>
#import "KIProgressViewManager.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSUserDefaults *saveData;
    NSString *callsign;
    CGRect rect;
}

@end

