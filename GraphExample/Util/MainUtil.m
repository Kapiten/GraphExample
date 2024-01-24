//
//  MainUtils.m
//  GraphExample
//
//  Created by Admin on 2024/01/22.
//

#import <Foundation/Foundation.h>

@interface MainUtil : NSObject
@property (strong, nonatomic) NSMutableDictionary *dData;
+ sharedMainUtil;
@end

@implementation MainUtil
    
static MainUtil *mainUtil = nil;

+ (id) sharedMainUtil {
    if(mainUtil==nil) {mainUtil = [[MainUtil alloc] init];}
    return mainUtil;
}

- (id) init {
    if(mainUtil==nil) {mainUtil = [super init]; _dData = [[NSMutableDictionary alloc] init];}
    return mainUtil;
}

@end
