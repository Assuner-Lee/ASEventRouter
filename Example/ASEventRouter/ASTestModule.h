//
//  ASTestModule.h
//  ASEventRouter_Example
//
//  Created by Assuner on 2018/7/1.
//  Copyright © 2018年 Assuner-Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASEventRouterTypes.h"

@interface ASTestModule : NSObject <ASModuleProtocol>
- (void)testEvent:(id<ASEventProtocol>)event;
- (NSInteger)testPrivateEvent:(id<ASPrivateEventProtocol>)event;
@end
