//
//  IndescribableAPI.m
//  IndescribableAPI
//
//  Created by 啟倫 陳 on 2014/5/15.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "IndescribableAPI.h"
#import <objc/runtime.h>

#import "IndescribableAPIRequestMaker.h"

@implementation IndescribableAPI

#pragma mark - class method

+ (void)artworksByParameter:(NSDictionary *)parameter completion:(void (^)(IndescribableAPIStatus status, NSDictionary *jsonResult))completion {
    [self sendAsyncRequest:[IndescribableAPIRequestMaker artworkByParameter:parameter] completion:completion];
}

+ (void)retrieveByParameter:(NSDictionary *)parameter completion:(void (^)(IndescribableAPIStatus status, NSDictionary *jsonResult))completion {
    [self sendAsyncRequest:[IndescribableAPIRequestMaker retrieveByParameter:parameter] completion:completion];
}

#pragma mark - private

+ (void)sendAsyncRequest:(NSMutableURLRequest *)request completion:(void (^)(IndescribableAPIStatus status, NSDictionary *jsonResult))completion {
    [NSURLConnection sendAsynchronousRequest:request queue:[self indescribableQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (connectionError) {
                completion(IndescribableAPIStatusFail, nil);
            }
            else {
                completion(IndescribableAPIStatusSuccess, [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]);
            }
        });
    }];
}

#pragma mark - runtime objects

+ (NSOperationQueue *)indescribableQueue {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        objc_setAssociatedObject(self, _cmd, [NSOperationQueue new], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    });
    return objc_getAssociatedObject(self, _cmd);
}

@end
