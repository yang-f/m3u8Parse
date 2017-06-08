//
//  M3u8SegmentList.h
//  m3u8Parse
//
//  Created by if on 08/06/2017.
//  Copyright © 2017 flying. All rights reserved.

#import <Foundation/Foundation.h>
@class M3u8SegmentInfo;

@interface M3u8SegmentList : NSObject

@property (assign) NSInteger length;

- (id)initWithSegments:(NSMutableArray *)segmentList;
- (void) rmSegment:(NSInteger)index;
- (M3u8SegmentInfo *)getSegment:(NSInteger)index;

@end
