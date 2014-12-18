//
//  AddLogTableViewController.h
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/16.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AddLogTableViewController : UITableViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIFont *faFont;
    CGRect rect;
    NSUserDefaults *saveData;
    UIPickerView *picker;
    NSArray *signalArray;
}
@end
