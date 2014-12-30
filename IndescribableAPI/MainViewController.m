//
//  MainViewController.m
//  IndescribableAPI
//
//  Created by 啟倫 陳 on 2014/5/15.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [IndescribableAPI artworksByParameter:nil completion:^(IndescribableAPIStatus status, NSDictionary *jsonResult) {
        if (status) {
            NSLog(@"%@", jsonResult);
        }
    }];
    
    /*[IndescribableAPI retrieveByParameter:@{@"site": @"pixiv", @"artwork_id": @"44196985"} completion:^(IndescribableAPIStatus status, NSDictionary *resultJson) {
        if (status) {
            NSLog(@"%@", resultJson);
        }
    }];*/
}

@end
