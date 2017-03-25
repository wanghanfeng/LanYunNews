//
//  NSString+JSON.h
//  xStore
//
//  Created by apple on 16/6/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)
+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;
@end
