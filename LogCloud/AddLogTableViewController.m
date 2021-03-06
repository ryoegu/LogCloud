//
//  AddLogTableViewController.m
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/16.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import "AddLogTableViewController.h"

#define cellIdentifier @"Cell"


@interface AddLogTableViewController ()
#pragma mark - user defined runtime attributes
@property(nonatomic, strong) NSString *LTlogo;
@property(nonatomic, strong) NSString *LTTextField;
@property(nonatomic, strong) NSString *RSlogo;
@property(nonatomic, strong) NSString *RSTextField1;
@property(nonatomic, strong) NSString *RSTextField2;
@end

@implementation AddLogTableViewController

#pragma mark - Basic Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    faFont=[UIFont fontWithName:@"FontAwesome" size:20];
    rect = [[UIScreen mainScreen] bounds];
    saveData=[NSUserDefaults standardUserDefaults];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //textField delegate
    inputTextField.delegate=self;
    customKeyboard = [CustomRSReportKeyboard new];
    iconLabel.font = faFont;
    [self setIconInLabel];
}
-(void)setIconInLabel{
    switch (iconLabel.tag) {
        case 101:
            //コールサイン
            iconLabel.text= @"\uf0c0";
            break;
        case 102:
            //更新日時
            iconLabel.text= @"\uf0c0";
            break;
        case 103:
            //RS
            iconLabel.text= @"\uf0c0";
            break;
        case 104:
            //RS
            iconLabel.text= @"\uf0c0";
            break;
        case 105:
            //周波数
            iconLabel.text= @"\uf0c0";
            break;
        case 106:
            //モード
            iconLabel.text= @"\uf0c0";
            break;
        case 107:
            //名前
            iconLabel.text= @"\uf0c0";
        }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Close Method
- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Parse Methods
-(void)searchCallSign{
    
}
-(void)saveOnParse{
    
}




/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
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
-(NSString *)nowTimeByString{
    NSDate *nowdate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    return [dateFormatter stringFromDate:nowdate];
}
#pragma mark - Text Field Delegate Methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    switch (textField.tag) {
        case 2:
            textField.text=[self nowTimeByString];
            return YES;
            break;
        case 11:
            textField.text=@"";
            customKeyboard.activeTextField=textField;
            textField.inputView=customKeyboard;
            return YES;
            break;
        case 12:
            textField.text=@"";
            customKeyboard.activeTextField=textField;
            textField.inputView=customKeyboard;
            return YES;
            break;
        default:
            return YES;
            break;
    }
}

// リターンキーが押されたら、キーボードを閉じたり、次のテキストフィールドに移動したりする
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch (inputTextField.tag) {
        case 1:
            [[self.view viewWithTag:2] becomeFirstResponder];
            return YES;
            break;
        case 2:
            [[self.view viewWithTag:11] becomeFirstResponder];
            return YES;
            break;
        case 11:
            [[self.view viewWithTag:12] becomeFirstResponder];
            return YES;
            break;
        case 12:
            [[self.view viewWithTag:3] becomeFirstResponder];
            return YES;
            break;
        case 3:
            [[self.view viewWithTag:4] becomeFirstResponder];
            return YES;
            break;
        case 4:
            [[self.view viewWithTag:5] becomeFirstResponder];
            return YES;
            break;
        case 5:
            [[self.view viewWithTag:6] becomeFirstResponder];
            return YES;
            break;
        default:
            [textField resignFirstResponder];
            return YES;
            break;
    }
}
//コールサイン入力時はすべて大文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 該当のtextField
    if(inputTextField.tag==1) {
        // deleteの時
        if( string.length == 0 ) return YES;
        
        BOOL canEdit = YES;
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890/"];
        for (int i = 0; i < string.length; i++)
        {
            unichar c = [string characterAtIndex:i];
            if (![myCharSet characterIsMember:c]) {
                canEdit = NO;
                
                if( 'a' <= c && c <= 'z' ) {
                    NSString *str = [[NSString stringWithFormat:@"%c", c] uppercaseString];
                    textField.text = [textField.text stringByReplacingCharactersInRange:NSMakeRange(range.location+i, 0) withString:str];
                }
            }
        }
        return canEdit;
    }else return YES;
}



#pragma mark - get GL and JCC/JCG
//next version

@end
