//
//  ViewController.m
//  WCDBDemo
//
//  Created by HomerLynn on 2017/10/11.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

#import "ViewController.h"
#import "MessageStore.h"
#import "Message.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MessageStore *store = [[MessageStore alloc] init];
    Message *message = [[Message alloc] init];
    message.content = @"123";
    [store insertMessage:message];
}

@end
