//
//  ASViewController.m
//  ASEventRouter
//
//  Created by Assuner-Lee on 06/17/2018.
//  Copyright (c) 2018 Assuner-Lee. All rights reserved.
//

#import "ASViewController.h"
#import "ASEventRouter.h"

@interface ASViewController ()
- (IBAction)testEvent:(id)sender;
- (IBAction)testPrivateEvent:(id)sender;
@end

@implementation ASViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testEvent:(id)sender {
    ASEvent *event = [ASEvent eventWithSelector:@"testEvent:"];
    event.args = @{@"arg": @"testArg"};
    [[ASEventRouter sharedInstacnce] sendEvent:event];
}

- (IBAction)testPrivateEvent:(id)sender {
    ASPrivateEvent *event = [ASPrivateEvent eventWithSelector:@"testPrivateEvent:" privateModule:@"ASTestModule"];
    event.args = @{@"arg": @10};
    NSInteger retValue = [[[ASEventRouter sharedInstacnce] sendPrivateEvent:event] integerValue];
    NSLog(@"send private event: retValue: %zd", retValue);
}
@end
