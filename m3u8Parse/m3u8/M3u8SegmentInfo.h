//
//  M3u8SegmenterInfo.h
//  m3u8Parse
//
//  Created by if on 08/06/2017.
//  Copyright © 2017 flying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface M3u8SegmentInfo : NSObject

@property(readwrite,assign)NSInteger duration;
@property(readwrite,assign)NSInteger programId;
@property(readwrite,strong)NSString *url;
@property(readwrite,strong)NSString *name;

@end
