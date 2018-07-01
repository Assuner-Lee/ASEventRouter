//
//  ASEventRouter.m
//  ASEventRouter
//
//  Created by Assuner on 2018/6/17.
//

#import "ASEventRouter.h"
#import "NSObject+ASEventRouter.h"

@interface ASEventRouter ()
@property (nonatomic, strong) NSMutableArray *moduleObjects;
@end

@implementation ASEventRouter

+ (void)load {
    [self sharedInstacnce];
}

+ (instancetype)sharedInstacnce {
    static ASEventRouter *router;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[self alloc] init];
    });
    return router;
}

- (instancetype)init {
    if (self = [super init]) {
        [self _loadModules];
    }
    return self;
}

- (void)sendEvent:(id<ASEventProtocol>)event {
    SEL eventSelector = NSSelectorFromString(event.selector);
    [self.moduleObjects enumerateObjectsUsingBlock:^(id<ASModuleProtocol>  _Nonnull module, NSUInteger idx,  BOOL * _Nonnull stop) {
        if ([module respondsToSelector:eventSelector]) {
            if (event.async) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [module performSelector:eventSelector withObject:event];
                });
            } else {
                [module performSelector:eventSelector withObject:event];
            }
        }
    }];
}

- (id)sendPrivateEvent:(id<ASPrivateEventProtocol>)event {
    NSParameterAssert(event);
    SEL eventSelector = NSSelectorFromString(event.selector);
    Class moduleClass = NSClassFromString(event.privateModule);
    NSParameterAssert(eventSelector);
    NSParameterAssert(moduleClass);
    if (!eventSelector || !moduleClass) return nil;
    for (id module in self.moduleObjects) {
        if ([module isKindOfClass:moduleClass] && [module respondsToSelector:eventSelector]) {
            return [module as_performSelector:eventSelector withObjects:@[event]];
        }
    }
    return nil;
}

#pragma mark - private methods

- (void)_loadModules {
    NSArray *moduleClasses = as_getMatchedClasses(^BOOL(__unsafe_unretained Class cls) {
        return [NSStringFromClass(cls) containsString:@"Module"] && [cls conformsToProtocol:@protocol(ASModuleProtocol)];
    });
    self.moduleObjects = [[NSMutableArray alloc] init];
    [moduleClasses enumerateObjectsUsingBlock:^(Class  _Nonnull cls, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.moduleObjects addObject:[[cls alloc] init]];
    }];
}

@end
