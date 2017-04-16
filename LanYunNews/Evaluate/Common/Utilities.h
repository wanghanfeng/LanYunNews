//
//  Utility.h
//  GoodCoder
//
//  Created by Wang,Hanfeng on 17/4/11.
//  Copyright © 2017年 Wang,Hanfeng. All rights reserved.
//

#ifndef Utility_h
#define Utility_h

//weakself
#define WEAK_REF(obj) \
__weak typeof(obj) weak_##obj = obj; \

#define STRONG_REF(obj) \
__strong typeof(weak_##obj) obj = weak_##obj; \

#define PREP_BLOCK WEAK_REF(self);

#define BEGIN_BLOCK \
STRONG_REF(self); \
if(self != nil){ \

#define END_BLOCK }
#define END_RETRUN_BLOCK \
}  \
return nil;

#endif /* Utility_h */
