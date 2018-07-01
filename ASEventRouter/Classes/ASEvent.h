//
//  ASEvent.h
//  ASEventRouter
//
//  Created by Assuner on 2018/6/17.
//

#import <Foundation/Foundation.h>
#import "ASEventRouterTypes.h"

@interface ASEvent : NSObject <ASEventProtocol>
+ (instancetype)eventWithSelector:(NSString *)selector;
@end

@interface ASPrivateEvent : ASEvent <ASPrivateEventProtocol>
+ (instancetype)eventWithSelector:(NSString *)selector privateModule:(NSString *)moduleName;
@end
