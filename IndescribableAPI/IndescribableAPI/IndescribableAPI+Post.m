//
//  IndescribableAPI+Post.m
//  IndescribableAPI
//
//  Created by 啟倫 陳 on 2014/5/15.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "IndescribableAPI+Post.h"

@implementation IndescribableAPI (Post)

#pragma mark - public function

void get(NSString* urlString, NSString* params, void(^completion)(NSURLResponse *response, NSDictionary *resultJson, NSError *connectionError)) {
    
    NSURL *requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", urlString, params]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    request.HTTPMethod = @"GET";
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               completion(response,
                                          [NSJSONSerialization JSONObjectWithData:data
                                                                          options:NSJSONReadingMutableContainers
                                                                            error:nil],
                                          connectionError);
                           }];
    
}

NSString* params(NSDictionary* parameter) {
    
    NSMutableArray *paramsArray = [NSMutableArray array];
    
    for (NSString *eachKey in parameter) {
        [paramsArray addObject:setKeyValue(eachKey, [parameter objectForKey:eachKey])];
    }
    
    if ([paramsArray count]) {
        return [NSString stringWithFormat:@"?%@", [paramsArray componentsJoinedByString:@"&"]];
    } else {
        return @"";
    }
    
}

#pragma mark - private

NSString* setKeyValue(NSString* key, NSString* value) {
    return [NSString stringWithFormat:@"%@=%@", key, value];
}

@end
