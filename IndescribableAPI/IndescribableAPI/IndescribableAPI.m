//
//  IndescribableAPI.m
//  IndescribableAPI
//
//  Created by 啟倫 陳 on 2014/5/15.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "IndescribableAPI.h"

#import "IndescribableAPI+Post.h"

@implementation IndescribableAPI

+(void) searchList : (NSDictionary*) parameter completion : (void(^)(void)) completion {
    
    get(@"http://api.neko.maid.tw/artwork.json",
         params(parameter),
         ^(NSURLResponse *response, NSData *data, NSError *connectionError) {
             
             NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data
                                                          options:NSJSONReadingMutableContainers
                                                            error:nil]);
             
         });
    
}

@end
