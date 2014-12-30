//
//  IndescribableAPIRequestMaker.h
//  IndescribableAPI
//
//  Created by 啟倫 陳 on 2014/12/30.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IndescribableAPIRequestMaker : NSObject

+ (NSMutableURLRequest *)artworkByParameter:(NSDictionary *)parameter;
+ (NSMutableURLRequest *)retrieveByParameter:(NSDictionary *)parameter;

@end
