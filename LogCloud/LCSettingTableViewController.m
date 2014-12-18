//
//  LCSettingTableViewController.m
//  LogCloud
//
//  Created by Ryo Eguchi on 2014/12/07.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import "LCSettingTableViewController.h"

@interface LCSettingTableViewController ()

@end

@implementation LCSettingTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    faFont=[UIFont fontWithName:@"FontAwesome" size:20];
    rect = [[UIScreen mainScreen] bounds];
    
    saveData=[NSUserDefaults standardUserDefaults];
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 4;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 1;
            break;
        default:
            return 2;
            break;
    }
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger) section {
    switch(section) {
        case 0:
            return @"公開情報";
        case 1:
            return @"パスワード";
        case 2:
            return @"運用情報";
        case 3:
            return @"QSLカード";
        default:
            return @"QSLカード";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    // セルが選択できないように設定する
    if(indexPath.section !=1){
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if(indexPath.section==1){
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    // セクション毎に設定する
    if (indexPath.section == 0) {
        // 行毎に設定する
        if (indexPath.row == 0) {
            // セルのタイトルを設定する
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf0c0";
            // テキストフィールドを設定する
//            UITextField *nameTextField = [[UITextField alloc] initWithFrame:CGRectMake()];
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"名前";
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
            nameTextField.text = [saveData objectForKey:@"NAME"];
            // セルに追加する
            [cell addSubview:nameTextField];
        } else if (indexPath.row == 1) {
            // セルのタイトルを設定する
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf031";
            // テキストフィールドを設定する
            //            UITextField *nameTextField = [[UITextField alloc] initWithFrame:CGRectMake()];
            callSignTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            callSignTextField.placeholder = @"コールサイン（必須）";
            // タグを設定する
            callSignTextField.tag = 2;
            // キーボードの種類を設定する
            callSignTextField.keyboardType = UIKeyboardTypeDefault;
            // キーボードのリターンキーの種類を設定する
            callSignTextField.returnKeyType = UIReturnKeyNext;
            // テキスト入力中に消去ボタンを表示するように設定する
            callSignTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            callSignTextField.delegate = self;
            callSignTextField.text = [saveData objectForKey:@"CALLSIGN"];
            // セルに追加する
            [cell addSubview:callSignTextField];
        } else if(indexPath.row==2){
            // ウェブサイト
            // セルのタイトルを設定する
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf0c1";
            // テキストフィールドを設定する
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"ウェブサイト";
            // タグを設定する
            nameTextField.tag = 3;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeURL;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyNext;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            nameTextField.text=[saveData objectForKey:@"WEBSITE"];
            // セルに追加する
            [cell addSubview:nameTextField];
        }else if(indexPath.row==3){
            // 一言メッセージ
            // セルのタイトルを設定する
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf05a";
            // テキストフィールドを設定する
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"自己紹介";
            // タグを設定する
            nameTextField.tag = 4;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeDefault;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyDone;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            nameTextField.text=[saveData objectForKey:@"COMMENT"];
            // セルに追加する
            [cell addSubview:nameTextField];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //パスワード設定
            cell.textLabel.font=faFont;
            cell.textLabel.text=@"\uf023";
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(60,10, 300, 25 )];
            label.text=@"パスワードを再設定";
            [cell addSubview:label];
        }
    }else if(indexPath.section ==2){
        if(indexPath.row==0){
            // 移動地
            // セルのタイトルを設定する
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf0ac";
            // テキストフィールドを設定する
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"移動地";
            // タグを設定する
            nameTextField.tag = 5;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeDefault;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyDone;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            // セルに追加する
            [cell addSubview:nameTextField];
        }else if(indexPath.row==1){
            // 移動地
            // セルのタイトルを設定する
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf135";
            // テキストフィールドを設定する
            UITextField * nameTextField =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, rect.size.width-100, 25)];
            //プレイスホルダーを設定する
            nameTextField.placeholder = @"無線機";
            // タグを設定する
            nameTextField.tag = 5;
            // キーボードの種類を設定する
            nameTextField.keyboardType = UIKeyboardTypeDefault;
            // キーボードのリターンキーの種類を設定する
            nameTextField.returnKeyType = UIReturnKeyDone;
            // テキスト入力中に消去ボタンを表示するように設定する
            nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            //デリゲートを設定する
            nameTextField.delegate = self;
            // セルに追加する
            [cell addSubview:nameTextField];
        }
    }else if(indexPath.section==3){
        if (indexPath.row==0) {
            cell.textLabel.text=@"QSLカードを交換します";
            UISwitch *qslExchangeSwitch=[[UISwitch alloc]initWithFrame:CGRectMake(rect.size.width-70, 5, 0, 0)];
            qslExchangeSwitch.on = YES;
            qslExchangeSwitch.tag=6;
            [qslExchangeSwitch addTarget:self action:@selector(qslExchangeSwitchEvent:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:qslExchangeSwitch];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"passwordChangeSegue" sender:self];

}
-(IBAction)qslExchangeSwitchEvent:(id)sender{
    
}

-(void)saveOnUserDefaults{
    [saveData setObject:callSignTextField.text forKey:@"CALLSIGN"];
    
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
            [[self.view viewWithTag:2] becomeFirstResponder];
            return NO;
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
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 該当のtextField
    if( textField == callSignTextField) {
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

@end
