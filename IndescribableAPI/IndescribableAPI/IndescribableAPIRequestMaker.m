//
//  IndescribableAPIRequestMaker.m
//  IndescribableAPI
//
//  Created by 啟倫 陳 on 2014/12/30.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "IndescribableAPIRequestMaker.h"

@implementation NSDictionary (Indescribable)

- (NSString *)indescribable_parameterString {
    NSMutableArray *paramsArray = [NSMutableArray array];
    for (NSString *eachKey in [self allKeys]) {
        [paramsArray addObject:[NSString stringWithFormat:@"%@=%@", eachKey, self[eachKey]]];
    }
    
    if ([paramsArray count]) {
        return [NSString stringWithFormat:@"?%@", [paramsArray componentsJoinedByString:@"&"]];
    }
    else {
        return @"";
    }
}

@end

@implementation IndescribableAPIRequestMaker

+ (NSMutableURLRequest *)artworkByParameter:(NSDictionary *)parameter {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.neko.maid.tw/artwork.json%@", [parameter indescribable_parameterString]?:@""]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    return request;
}

+ (NSMutableURLRequest *)retrieveByParameter:(NSDictionary *)parameter {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.neko.maid.tw/retrieve.json%@", [parameter indescribable_parameterString]?:@""]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    return request;
}

@end
