//
//  MiDictionary.m
//  GraphExample
//
//  Created by Admin on 2024/01/24.
//

#import <Foundation/Foundation.h>
#import "MiDictionary.h"

@interface MiDictionary ()

@end

@implementation MiDictionary

- (instancetype)init
{
    self = [super init];
    if (self) {
        _allLabels = [[NSArray alloc] init];
        _allValues = [[NSArray alloc] init];
    }
    return self;
}

- (void)setValue:(id)value forLabel:(NSString *)label {
    NSMutableArray *arrayLabel = _allLabels.mutableCopy;
    [arrayLabel addObject:label];
    _allLabels = arrayLabel;
    NSMutableArray *arrayValue = _allValues.mutableCopy;
    [arrayValue addObject:value];
    _allValues = arrayValue;
}

- (id)valueForLabel:(NSString *)label {
    return [_allValues objectAtIndex:[_allLabels indexOfObject:label]];
}

@end
