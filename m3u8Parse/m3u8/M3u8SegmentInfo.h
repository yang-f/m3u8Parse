//
//  M3u8SegmenterInfo.h
//
//  Created by yangfei on 16-06-08.
//  Copyright (c) 2016年 hulu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface M3u8SegmentInfo : NSObject

@property(readwrite,assign)NSInteger duration;
@property(readwrite,assign)NSInteger programId;
@property(readwrite,strong)NSString *url;
@property(readwrite,strong)NSString *name;

@end
