//
//  ASTestModule.m
//  ASEventRouter_Example
//
//  Created by Assuner on 2018/7/1.
//  Copyright © 2018年 Assuner-Lee. All rights reserved.
//

#import "ASTestModule.h"

@implementation ASTestModule

- (void)testEvent:(id<ASEventProtocol>)event {
    NSString *arg = event.args[@"arg"];
    NSLog(@"textEvent: executed, arg: %@", arg);
}

- (NSInteger)testPrivateEvent:(id<ASPrivateEventProtocol>)event {
    NSInteger arg = [event.args[@"arg"] integerValue];
    NSInteger retValue = arg + 3;
    NSLog(@"testPrivateEvent: executed, arg: %zd, return %zd", arg, retValue);
    return retValue;
}
@end
