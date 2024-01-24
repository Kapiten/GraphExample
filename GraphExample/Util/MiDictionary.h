//
//  MiDictionary.h
//  GraphExample
//
//  Created by Admin on 2024/01/24.
//

#ifndef MiDictionary_h
#define MiDictionary_h


#endif /* MiDictionary_h */

#import <Foundation/Foundation.h>

@interface MiDictionary : NSObject
@property (strong, nonatomic) NSArray *allLabels;
@property (strong, nonatomic) NSArray *allValues;
- (void)setValue:(id)value forLabel:(NSString*)label;
- (id)valueForLabel:(NSString *)label;
//- (NSString*)valueForLabel:(NSString *)label;

@end
