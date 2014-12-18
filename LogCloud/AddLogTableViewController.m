//
//  AddLogTableViewController.m
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/16.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import "AddLogTableViewController.h"

@interface AddLogTableViewController ()

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
    //Arrayを作成
    signalArray = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
    //PickerViewを生成
    picker=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 620,rect.size.width, 210)];
    picker.showsSelectionIndicator=YES;
    picker.delegate=self;
    picker.dataSource=self;
    [self.view addSubview:picker];
    
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



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //セクション数
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    //各セクションごとの行数
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
        default:
            return 2;
            break;
    }

}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger) section {
    switch(section) {
        case 0:
            return @"コールサイン";
        case 1:
            return @"基本情報";
        default:
            return @"";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    // セルが選択できないように設定する
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // セクション毎に設定する
    if (indexPath.section == 0) {
        // 行毎に設定する
        //コールサイン
        if (indexPath.row == 0) {
            // セルのタイトルを設定する
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf0c0";
            // テキストフィールドを設定する
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"コールサイン";
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
            // セルに追加する
            [cell addSubview:nameTextField];
        }
    }else if(indexPath.section==1){
        if (indexPath.row == 0) {
            // RSレポート
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf0c0";
            // テキストフィールドを設定する
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"自分のRS(T)レポート";
            // タグを設定する
            nameTextField.tag = 2;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeNumberPad;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyNext;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            // セルに追加する
            [cell addSubview:nameTextField];
        }else if(indexPath.row==1){
            // 名前
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf0c0";
            // テキストフィールドを設定する
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"相手のRS(T)レポート";
            // タグを設定する
            nameTextField.tag = 3;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeNumberPad;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyNext;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            // セルに追加する
            [cell addSubview:nameTextField];
        }else if(indexPath.row==2){
            // 名前
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf0c0";
            // テキストフィールドを設定する
            //            UITextField *nameTextField = [[UITextField alloc] initWithFrame:CGRectMake()];
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"周波数";
            // タグを設定する
            nameTextField.tag = 3;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeNumberPad;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyNext;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            // セルに追加する
            [cell addSubview:nameTextField];
        }else if(indexPath.row==3){
            // 名前
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf0c0";
            // テキストフィールドを設定する
            //            UITextField *nameTextField = [[UITextField alloc] initWithFrame:CGRectMake()];
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"モード";
            // タグを設定する
            nameTextField.tag = 4;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeNumberPad;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyNext;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            // セルに追加する
            [cell addSubview:nameTextField];
        }
    }
    
    else if(indexPath.section==2){
        
        if (indexPath.row == 0) {
            // 名前
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf0c0";
            // テキストフィールドを設定する
            //            UITextField *nameTextField = [[UITextField alloc] initWithFrame:CGRectMake()];
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"名前";
            // タグを設定する
            nameTextField.tag = 5;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeDefault;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyNext;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            // セルに追加する
            [cell addSubview:nameTextField];
        }else if(indexPath.row==1){
            // 名前
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf0c0";
            // テキストフィールドを設定する
            //            UITextField *nameTextField = [[UITextField alloc] initWithFrame:CGRectMake()];
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"QTH";
            // タグを設定する
            nameTextField.tag = 6;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeDefault;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyNext;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            // セルに追加する
            [cell addSubview:nameTextField];
        }
    }
    return cell;
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
#pragma mark - Text Field Delegate Methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    switch (textField.tag) {
        case 2:
            [self showPicker];
            return NO;
            break;
        case 3:
            [self showPicker];
            return NO;
            break;
        default:
            [self hidePicker];
            return YES;
            break;
    }
}

// リターンキーが押されたら、キーボードを閉じたり、次のテキストフィールドに移動したりする
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch (textField.tag) {
        case 1:
            [[self.view viewWithTag:2] becomeFirstResponder];
            return YES;
        case 2:
            [[self.view viewWithTag:3] becomeFirstResponder];
            return NO;
        case 3:
            [[self.view viewWithTag:4] becomeFirstResponder];
            return NO;
        case 4:
            [textField resignFirstResponder];
            return YES;
        default:
            [textField resignFirstResponder];
            return YES;
    }
}
//コールサイン入力時はすべて大文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 該当のtextField
    if( textField.tag==1) {
        // deleteの時
        if( string.length == 0 ) return YES;
        
        BOOL canEdit = YES;
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"];
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


#pragma mark - Pickerを表示するメソッド
- (void)showPicker {
    // ピッカーが下から出るアニメーション
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    picker.frame = CGRectMake(0, rect.size.height-230,rect.size.width, 180);
    picker.backgroundColor=[UIColor whiteColor];
    
    [UIView commitAnimations];
    
    // 右上にdoneボタン
    if (!self.navigationItem.rightBarButtonItem) {
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
        [self.navigationItem setRightBarButtonItem:doneButton animated:YES];
    }
}


- (void)hidePicker {
    // ピッカーが下に隠れるアニメーション
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    picker.frame = CGRectMake(0, 620,rect.size.width, 180);
    [UIView commitAnimations];
    
    // doneボタンを消す
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}


- (void)done:(id)sender {
    // ピッカーしまう
    [self hidePicker];
    
    // doneボタン消す
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}

#pragma mark - Picker View Delegate Mathods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}
// 表示する内容を返す例
-(NSString*)pickerView:(UIPickerView*)pickerView
           titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    // 行インデックス番号を返す
    return [signalArray objectAtIndex:row];
    
}

#pragma mark - get GL and JCC/JCG


@end
