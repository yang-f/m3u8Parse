//
//  M3u8Handler.m
//
//  Created by yangfei on 16-06-08.
//  Copyright (c) 2016年 hulu. All rights reserved.
//

#import "M3u8Handler.h"
#import "M3u8SegmentInfo.h"
#import "M3u8SegmentList.h"

@implementation M3u8Handler
@synthesize segmentList=_segmentList,delegate =  _delegate;

- (NSString *)getM3u8Url:(NSArray *) urls
{
    NSString *url = @"";
    for (id obj in urls)
    {
        if([[obj objectForKey:@"url"] rangeOfString:@".m3u8"].length != 0)
        {
            url = [obj objectForKey:@"url"];
            break;
        }
    }
    return url;
}

- (void) prase:(NSString *)path
{
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    NSString *data = [[NSString alloc]initWithData:fileData encoding:NSUTF8StringEncoding];
    if(data == nil)
    {
        if(self.delegate != nil && [self.delegate respondsToSelector:@selector(praseM3U8Failed:)])
        {
            [self.delegate praseM3U8Failed:self];
        }
        return;
    }

    NSMutableArray *segments = [[NSMutableArray alloc] init];
    NSRange segmentRange = [data rangeOfString:@"#EXTINF:"];
    while (segmentRange.location != NSNotFound)
    {
        M3u8SegmentInfo * segment = [[M3u8SegmentInfo alloc]init];
        NSRange tmpRange = [data rangeOfString:@","];
        NSString* value = [data substringWithRange:NSMakeRange(segmentRange.location + [@"#EXTINF:" length], tmpRange.location -(segmentRange.location + [@"#EXTINF:" length]))];
        segment.duration = [value intValue];

        data = [data substringFromIndex:tmpRange.location];
        NSRange linkRangeBegin = [data rangeOfString:@",\n"];
        NSRange linkRangeEnd = [data rangeOfString:@".ts"];
        NSString* linkurl = [data substringWithRange:NSMakeRange(linkRangeBegin.location + [@",\n" length], linkRangeEnd.location - linkRangeBegin.location - linkRangeBegin.length + [(@".ts") length])];
        segment.url = linkurl;
        segment.name = linkurl;
        [segments addObject:segment];
        data = [data substringFromIndex:linkRangeEnd.location];
        segmentRange = [data rangeOfString:@"#EXTINF:"];
    }
    
    self.segmentList = [[M3u8SegmentList alloc] initWithSegments:segments];
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(praseM3U8Finished:)])
    {
        [self.delegate praseM3U8Finished:self];
    }
}

@end
