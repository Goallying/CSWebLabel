//
//  UILabel+Async.m
//  LiveVideo
//
//  Created by 朱来飞 on 2018/3/7.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "UILabel+Async.h"
#import "YYCache.h"
#import "RequestManager.h"
@implementation UILabel (Async)

- (void)setTextAsyncURL:(NSString *)urls placeholderText:(NSString *)placeholder{
    
    if (placeholder) {
        self.text = placeholder ;
    }
    YYCache * cache = [YYCache cacheWithName:@"AsyncLabelCache"];
    if ([cache containsObjectForKey:urls]) {
        self.text = [NSString stringWithFormat:@"%@",[cache objectForKey:urls]];
    }else{
        // this should be your request
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.text = @"your requested  text" ;
            [cache setObject:@"your requested  text" forKey:urls];
        });
    }
 
}
@end
