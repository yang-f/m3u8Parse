//
//  M3u8SegmentList.m
//  m3u8Parse
//
//  Created by if on 08/06/2017.
//  Copyright © 2017 flying. All rights reserved.

#import "M3u8SegmentList.h"
#import "M3u8SegmentInfo.h"

@implementation M3u8SegmentList
{
    NSMutableArray *segments;
}

@synthesize length;

- (id)initWithSegments:(NSMutableArray *)segmentList
{
    self = [super init];
    if(self != nil)
    {
        segments = segmentList;
        self.length = [segmentList count];
    }
    return self;
}

- (M3u8SegmentInfo *)getSegment:(NSInteger)index
{
    if( index >=0 && index < self.length)
    {
        return (M3u8SegmentInfo *)[segments objectAtIndex:index];
    }
    else
    {
        return nil;
    }
}

- (void)rmSegment:(NSInteger)index
{
    if(self != nil)
    {
        [segments removeObjectAtIndex:index];
        self.length = [segments count];
    }
}

@end
