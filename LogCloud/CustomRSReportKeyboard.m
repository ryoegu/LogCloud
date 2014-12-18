//
//  CustomRSReportKeyboard.m
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/19.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import "CustomRSReportKeyboard.h"

@implementation CustomRSReportKeyboard


-(id)init{

    self = [super init];
    if (self) {
        // UINibで作成したxibファイルを取得
        UINib *nib = [UINib nibWithNibName:@"CustomKeyboard" bundle:nil];
        // 0番目の要素（一番最初に置いたUIView）を取得して自分自身にセット
        // ※ self は、initメソッド内であれば代入できる
        self = [nib instantiateWithOwner:nil options:nil][0];
        
        
        signalArrayR=[NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5",nil];
        signalArrayS = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
        signalArrayT = [NSArray arrayWithObjects:@"",@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
        picker.delegate=self;
        picker.dataSource=self;
        [picker selectRow:4 inComponent:0 animated:NO];
        [picker selectRow:8 inComponent:1 animated:NO];
        [picker selectRow:0 inComponent:2 animated:NO];
        rssReport=nil;
    }

    return self;
}

- (IBAction)doneButton:(id)sender {
    if (rssReport==nil) {
        rssReport=@"59";
    }
    self.activeTextField.text = [self.activeTextField.text stringByAppendingString:rssReport];

     [self.activeTextField resignFirstResponder];
}

#pragma mark - Picker View Delegate Mathods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return [signalArrayR count];
            break;
        case 1:
            return [signalArrayS count];
            break;
        default:
            return [signalArrayT count];
            break;
    }
    
}
-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row          forComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return [signalArrayR objectAtIndex:row];
        case 1:
            return [signalArrayS objectAtIndex:row];
            break;
        default:
            return [signalArrayT objectAtIndex:row];
            break;
    }
}
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 1列目の選択された行数を取得
    NSInteger r = [pickerView selectedRowInComponent:0];
    
    // 2列目の選択された行数を取得
    NSInteger s = [pickerView selectedRowInComponent:1];
    
    // 3列目の選択された行数を取得
    NSInteger t = [pickerView selectedRowInComponent:2];
    if(t==0){
        //Tはなし
        rssReport = [NSString stringWithFormat:@"%ld%ld",r+1,s+1];
    }else{
        //Tあり
        rssReport = [NSString stringWithFormat:@"%ld%ld%ld",r+1,s+1,t];
    }

}

@end
