//
//  AddLogTableViewController.h
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/16.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CustomRSReportKeyboard.h"
#import "UIPlaceHolderTextView.h"

@interface AddLogTableViewController : UITableViewController<UITextFieldDelegate,UITextViewDelegate>
{
    UIFont *faFont;
    CGRect rect;
    NSUserDefaults *saveData;
    UIPickerView *picker;
    NSArray *signalArray;
    UIToolbar *keyboardToolbar;
    CustomRSReportKeyboard *customKeyboard;
    IBOutlet UILabel *iconLabel;
    IBOutlet UITextField *inputTextField;
    IBOutlet UISwitch *qslSwitch;
    
}
- (IBAction)closeButton:(id)sender;

@end
