//
//  DSEnvironment.m
//  AxeSync
//
//  Created by Sam Westrich on 7/20/18.
//

#import "DSEnvironment.h"
#import "DSWallet.h"
#import "DSChainsManager.h"
#import "DSAccount.h"

@implementation DSEnvironment

+ (instancetype)sharedInstance
{
    static id singleton = nil;
    static dispatch_once_t onceToken = 0;
    
    dispatch_once(&onceToken, ^{
        singleton = [self new];
    });
    
    return singleton;
}

// true if this is a "watch only" wallet with no signing ability
- (BOOL)watchOnly
{
    static BOOL watchOnly;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            for (DSChain * chain in [[DSChainsManager sharedInstance] chains]) {
                for (DSWallet * wallet in [chain wallets]) {
                    DSAccount * account = [wallet accountWithNumber:0];
                    NSString * keyString = [[account bip44DerivationPath] walletBasedExtendedPublicKeyLocationString];
                    NSError * error = nil;
                    NSData * v2BIP44Data = getKeychainData(keyString, &error);
                    
                    watchOnly = (v2BIP44Data && v2BIP44Data.length == 0) ? YES : NO;
                }
            }
        }
    });

    return watchOnly;
}

-(NSBundle*)resourceBundle {
    static NSBundle * resourceBundle = nil;
    static dispatch_once_t onceToken = 0;
    
    dispatch_once(&onceToken, ^{
        NSBundle *frameworkBundle = [NSBundle bundleForClass:[DSTransaction class]];
        NSURL *bundleURL = [[frameworkBundle resourceURL] URLByAppendingPathComponent:@"AxeSync.bundle"];
        resourceBundle = [NSBundle bundleWithURL:bundleURL];
    });
    return resourceBundle;
}


@end
