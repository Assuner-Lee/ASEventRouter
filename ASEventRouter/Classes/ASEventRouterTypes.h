//
//  ASEventRouterTypes.h
//  ASEventRouter
//
//  Created by Assuner on 2018/6/17.
//

#import <Foundation/Foundation.h>

@protocol ASModuleProtocol <NSObject>
@end


@protocol ASEventProtocol <NSObject>
@property (nonatomic, copy) NSString *selector;
@property (nonatomic, copy) NSDictionary *args;
@property (nonatomic, assign) BOOL async;
@end

@protocol ASPrivateEventProtocol <ASEventProtocol>
@property (nonatomic, copy) NSString *privateModule;
@end

@interface ASEventRouterTypes : NSObject
@end
