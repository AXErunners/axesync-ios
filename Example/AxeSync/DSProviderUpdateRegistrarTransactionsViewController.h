//
//  DSProviderUpdateRegistrarTransactionsViewController.h
//  AxeSync_Example
//
//  Created by Sam Westrich on 3/3/19.
//  Copyright © 2019 Axe Core Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSLocalMasternode;

NS_ASSUME_NONNULL_BEGIN

@interface DSProviderUpdateRegistrarTransactionsViewController : UITableViewController

@property (nonatomic,strong) DSLocalMasternode * localMasternode;

@end

NS_ASSUME_NONNULL_END
