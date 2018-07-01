//
//  ASEvent.m
//  ASEventRouter
//
//  Created by Assuner on 2018/6/17.
//

#import "ASEvent.h"

@implementation ASEvent
@synthesize selector = _selector;
@synthesize args = _args;
@synthesize async = _async;

+ (instancetype)eventWithSelector:(NSString *)selector {
    ASEvent *event = [[self alloc] init];
    event.selector = selector;
    return event;
}
@end

@implementation ASPrivateEvent
@synthesize privateModule = _privateModule;

+ (instancetype)eventWithSelector:(NSString *)selector privateModule:(NSString *)moduleName {
    ASPrivateEvent *event = [self eventWithSelector:selector];
    event.privateModule = moduleName;
    return event;
}

@end
