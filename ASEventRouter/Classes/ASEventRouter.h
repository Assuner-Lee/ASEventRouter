//
//  ASEventRouter.h
//  ASEventRouter
//
//  Created by Assuner on 2018/6/17.
//

#import <Foundation/Foundation.h>
#import "ASEvent.h"

@interface ASEventRouter : NSObject

+ (instancetype)sharedInstacnce;
- (void)sendEvent:(id<ASEventProtocol>)event;
- (id)sendPrivateEvent:(id<ASPrivateEventProtocol>)event;
@end
