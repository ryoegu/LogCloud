//
//  ChangePasswordTableViewController.m
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/09.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import "ChangePasswordTableViewController.h"

@interface ChangePasswordTableViewController ()

@end

@implementation ChangePasswordTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    faFont=[UIFont fontWithName:@"FontAwesome" size:20];
    rect = [[UIScreen mainScreen] bounds];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
        default:
            return 1;
            break;
    }
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger) section {
    switch(section) {
        case 0:
            return @"古いパスワード";
        case 1:
            return @"新しいパスワード";
        default:
            return @"";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 0) {
        // 行毎に設定する
        if (indexPath.row == 0) {
            // セルのタイトルを設定する
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf023";
            // テキストフィールドを設定する
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"古いパスワード";
            // タグを設定する
            nameTextField.tag = 1;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeDefault;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyNext;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            //パスワード用
            nameTextField.secureTextEntry =YES;
            // セルに追加する
            [cell addSubview:nameTextField];
        }
    }else if(indexPath.section==1){
        if(indexPath.row==0){
            // セルのタイトルを設定する
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf023";
            // テキストフィールドを設定する
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"新しいパスワード";
            // タグを設定する
            nameTextField.tag = 2;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeDefault;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyNext;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            //パスワード用
            nameTextField.secureTextEntry =YES;
            // セルに追加する
            [cell addSubview:nameTextField];
        }else if(indexPath.row==1){
            // セルのタイトルを設定する
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf023";
            // テキストフィールドを設定する
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"新しいパスワード（再入力）";
            // タグを設定する
            nameTextField.tag = 3;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeDefault;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyNext;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            //パスワード用
            nameTextField.secureTextEntry =YES;
            // セルに追加する
            [cell addSubview:nameTextField];
        }
    }
    return cell;
}

-(void)changePassword:(UITextField *)textField{
    //Parseの処理
}

//新しいパスワードと確認パスワードが一致しているかチェック
-(BOOL)passwordCheckWithConfirmPassword:(UITextField *)textField{
    NSString *newPassword;
    NSString *confirmPassword;
    switch (textField.tag) {
        case 2:
            newPassword=textField.text;
        case 3:
            confirmPassword=textField.text;
    }
    if([newPassword isEqualToString:confirmPassword]){
        return YES;
    }else{
        return NO;
    }
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

// リターンキーが押されたら、キーボードを閉じたり、次のテキストフィールドに移動したりする
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch (textField.tag) {
        case 1:
            [textField resignFirstResponder];
            return YES;
        case 2:
            [[self.view viewWithTag:3] becomeFirstResponder];
            return NO;
         default:
            if([self passwordCheckWithConfirmPassword:textField]){
                [self changePassword:textField];
                [textField resignFirstResponder];
                return YES;
            }else{
                UIAlertView *alert =[[UIAlertView alloc]
                                     initWithTitle:@"パスワードが一致しません"
                                     message:@"新しいパスワードと確認用パスワードには同じパスワードを入力してください。"
                                     delegate:self
                                     cancelButtonTitle:nil
                                     otherButtonTitles:@"OK", nil];
                
                [alert show];
                return NO;
            }
    }
}

@end
