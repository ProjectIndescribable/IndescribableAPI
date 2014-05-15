//
//  IndescribableAPI+Post.h
//  IndescribableAPI
//
//  Created by 啟倫 陳 on 2014/5/15.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "IndescribableAPI.h"

@interface IndescribableAPI (Post)

void get(NSString* urlString, NSString* params, void(^completion)(NSURLResponse *response, NSData *data, NSError *connectionError));
NSString* params(NSDictionary* parameter);

@end
