//
//  NSObject+ASEventRouter.h
//  ASEventRouter
//
//  Created by Assuner on 2018/6/17.
//

#import <Foundation/Foundation.h>

NSArray<Class> *as_getMatchedClasses(BOOL(^block)(Class cls));

@interface NSObject (ASEventRouter)
+ (id)as_objectWithBuffer:(void *)valueLoc type:(const char *)typeStr;
- (void)as_getValue:(void *)valueLoc type:(const char *)argType; // id / NSValue Type
- (id)as_performSelector:(SEL)aSelector withObjects:(NSArray *)objects; // id / NSValue Type
@end

@interface NSInvocation (ASEventRouter)

- (id)as_getArgumentObjectAtIndex:(NSInteger)idx;
- (void)as_setArgumentObject:(id)arguementObject atIndex:(NSInteger)idx;

@end
