//
//  CustomRSReportKeyboard.h
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/19.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomRSReportKeyboard : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
{
    IBOutlet UIPickerView *picker;
    NSArray *signalArrayR;
    NSArray *signalArrayS;
    NSArray *signalArrayT;
    NSString *rssReport;
    
}
@property (nonatomic, retain)UITextField *activeTextField;

- (IBAction)doneButton:(id)sender;

@end
