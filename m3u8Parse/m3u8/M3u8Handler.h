//
//  M3u8Handler.h
//
//  Created by yangfei on 16-06-08.
//  Copyright (c) 2016年 hulu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class M3u8SegmentList;
@class M3u8Handler;
@class CapitalCloudAPIClient;
@class CapitalCloudRendition;
@protocol M3u8HandlerDelegate <NSObject>
@optional
    - (void)praseM3U8Finished:(M3u8Handler*)handler;
    - (void)praseM3U8Failed:(M3u8Handler*)handler;
@end

@interface M3u8Handler : NSObject

@property(nonatomic,weak)id<M3u8HandlerDelegate> delegate;
@property(nonatomic,retain)M3u8SegmentList* segmentList;


- (void) prase:(NSString*)path;

@end
