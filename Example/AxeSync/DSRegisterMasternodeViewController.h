//
//  DSRegisterMasternodeViewController.h
//  AxeSync_Example
//
//  Created by Sam Westrich on 2/9/19.
//  Copyright © 2019 Axe Core Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSAccountChooserViewController.h"
#import "DSWalletChooserViewController.h"
#import "DSSignPayloadViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DSRegisterMasternodeViewController : UITableViewController <DSAccountChooserDelegate,DSWalletChooserDelegate,DSSignPayloadDelegate>

@property (nonatomic,strong) DSChain * chain;

@end

NS_ASSUME_NONNULL_END
