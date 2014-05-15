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

+(void) searchList : (NSDictionary*) parameter completion : (void(^)(NSURLResponse *response, NSData *data, NSError *connectionError)) completion {
    
    get(@"http://api.neko.maid.tw/artwork.json",
         params(parameter),
         completion);
    
}

@end
