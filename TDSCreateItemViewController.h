//
//  TDSCreateItemViewController.h
//  ToDoSample
//
//  Created by 山田 和弘 on 2014/05/28.
//  Copyright (c) 2014年 kazu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDSCreateItemViewControllerDelegate;

@interface TDSCreateItemViewController : UITableViewController

@property (weak, nonatomic) id<TDSCreateItemViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)saveButtonTapped:(id)sender;
- (IBAction)cancelButtonTaped:(id)sender;

@end

@protocol TDSCreateItemViewControllerDelegate <NSObject>

- (void)createItemViewControllerDidFinish: (TDSCreateItemViewController *)controller item:(NSString *) item;
- (void)createItemViewControllerDidCancel: (TDSCreateItemViewController *)controller;

@end