//
//  M3u8SegmentList.h
//
//  Created by yangfei on 16-06-08.
//  Copyright (c) 2016年 hulu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class M3u8SegmentInfo;

@interface M3u8SegmentList : NSObject

@property (assign) NSInteger length;

- (id)initWithSegments:(NSMutableArray *)segmentList;
- (void) rmSegment:(NSInteger)index;
- (M3u8SegmentInfo *)getSegment:(NSInteger)index;

@end
