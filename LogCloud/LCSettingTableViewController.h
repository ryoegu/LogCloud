//
//  LCSettingTableViewController.h
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/07.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FontAwesomeKit/FontAwesomeKit.h>

@interface LCSettingTableViewController : UITableViewController<UITextFieldDelegate>
{
    UIFont*faFont;
    UITextField * callSignTextField;
    CGRect rect;
}
@end
