//
//  TDSItemListViewControllerTableViewController.m
//  ToDoSample
//
//  Created by 山田 和弘 on 2014/05/27.
//  Copyright (c) 2014年 kazu. All rights reserved.
//

#import "TDSItemListViewController.h"
#import "TDSCreateItemViewController.h"

@interface TDSItemListViewController () <TDSCreateItemViewControllerDelegate>

// 配列のプロパティ
@property NSMutableArray *items;

@end

@implementation TDSItemListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];

  // 編集ボタンの追加
  self.navigationItem.leftBarButtonItem = self.editButtonItem;


  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;

  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
  // Return the number of rows in the section.
  return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
  
  // UITableViewCelllをデフォルトのスタイルで生成する
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
  // 配列からアイテムを取得してLabelのテキストに代入
  cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
  return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Return NO if you do not want the specified item to be editable.
  return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    // Deleteボタンが押されたら配列からアイテムを削除する
    [_items removeObjectAtIndex:indexPath.row];
    // Delete the row from the data source
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
  } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Return NO if you do not want the item to be re-orderable.
  return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  if ([[segue identifier] isEqualToString:@"CreateItemSegue"]) {
    // 遷移先のTDSCreateItemViewControllerのインスタンスを取得する
    TDSCreateItemViewController *controller = (TDSCreateItemViewController *)[[[segue destinationViewController]viewControllers] objectAtIndex:0];
    // delegateプロパティにself(MasterViewController自身)を設定する
    controller.delegate = self;
  }
}

- (void) createItemViewControllerDidFinish:(TDSCreateItemViewController *) controller item:(NSString *)item {
  // 配列がない場合は生成する
  if (!_items) {
    _items = [[NSMutableArray alloc] init];
  }
  // アイテムを先頭に追加する
  [_items insertObject:item atIndex:0];
  
  // UITableViewにUITableViewCellを追加する
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];

}

@end
