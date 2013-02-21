//
//  NanoProfiler.m
//  test
//
//  Created by Tomer Shiri on 1/10/13.
//  Copyright (c) 2013 Tomer Shiri. All rights reserved.
//

#import "NanoProfiler.h"
#import "ProfilingService.h"
#import "TheWrapper.h"

@implementation NanoProfiler

+(id) init {
    return nil;
}

+(NSString*) getTimerNameForClass:(Class) clazz andSelector:(SEL) selector {
    return [NSString stringWithFormat:@"%@_%@",NSStringFromClass(clazz), NSStringFromSelector(selector)];
}

+(void) addProfiler:(Class) target andSelector:(SEL) selector {
    id preBlock = ^(id<NSObject> zelf, id firstArg, ...) {
        [ProfilingService startTimer:[NanoProfiler getTimerNameForClass:target andSelector:selector]];
    };

    id postBlock = ^id(id<NSObject> zelf, id functionReturnValue, id firstArg, ...) {
        [ProfilingService stopTimer:[NanoProfiler getTimerNameForClass:target andSelector:selector]];
        return functionReturnValue;
    };

    [TheWrapper addWrappertoClass:target andSelector:selector withPreRunBlock:preBlock andPostRunBlock:postBlock];
}

@end
