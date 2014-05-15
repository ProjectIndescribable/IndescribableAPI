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

-(void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - life cycle

-(void) viewDidLoad {
    [super viewDidLoad];
    
    [IndescribableAPI searchList:nil
                      completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                          NSLog(@"%@", data);
                      }];
    
}

@end
