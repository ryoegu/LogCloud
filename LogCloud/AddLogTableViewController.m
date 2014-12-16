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

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    //セクション数
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    //各セクションごとの行数
    // Return the number of rows in the section.
    return 5;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger) section {
    switch(section) {
        case 0:
            return @"コールサイン";
        case 1:
            return @"新しいパスワード";
        default:
            return @"";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    // セルが選択できないように設定する
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    // セクション毎に設定する
    if (indexPath.section == 0) {
        // 行毎に設定する
        //コールサイン
        if (indexPath.row == 0) {
            // セルのタイトルを設定する
            cell.textLabel.font=faFont;
            cell.textLabel.text = @"\uf0c0";
            // テキストフィールドを設定する
            //            UITextField *nameTextField = [[UITextField alloc] initWithFrame:CGRectMake()];
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

@end
