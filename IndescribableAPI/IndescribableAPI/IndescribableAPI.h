//
//  IndescribableAPI.h
//  IndescribableAPI
//
//  Created by 啟倫 陳 on 2014/5/15.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    IndescribableAPIStatusFail,
    IndescribableAPIStatusSuccess
} IndescribableAPIStatus;

@interface IndescribableAPI : NSObject

//難以名狀網站圖片內容
/*
 parameter 選填種類
 
 - sites
 網站來源：需為以下幾個字串中之一
 pixiv, nico, tinami
 
 - author_id
 作者的ID，建議搭配 sites 參數使用才能得到較正確的搜尋結果
 
 - artwork_id
 作品ID，建議搭配 sites 參數使用才能得到較正確的搜尋結果
 
 - rating
 若設定為以下其中一個值時，則會以該值所設定的規則讀取資料：
 all：僅列出非R-18的作品
 adult：僅列出R-18的作品
 
 - tag
 要搜尋的標籤關鍵字
 
 - start
 讀取資料起點，如未設定時預設為0
 
 - perpage
 每頁列出幾筆，如未設定時預設為每頁讀取50筆資料
 
 */
+ (void)artworksByParameter:(NSDictionary *)parameter completion:(void (^)(IndescribableAPIStatus status, NSDictionary *jsonResult))completion;

//請求抓取圖片
/*
 
 site 為網站來源, 需為以下幾個字串中之一
 - pixiv
 - nico
 - tinami
 
 artwork_id 為該作品的 id
 
 這兩個皆為必填
 */
+ (void)retrieveByParameter:(NSDictionary *)parameter completion:(void (^)(IndescribableAPIStatus status, NSDictionary *jsonResult))completion;

@end
