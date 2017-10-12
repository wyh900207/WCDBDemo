//
//  Message.m
//  WCDBDemo
//
//  Created by HomerLynn on 2017/10/11.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

#import "Message.h"

@implementation Message

WCDB_IMPLEMENTATION(Message)

WCDB_SYNTHESIZE(Message, messageID)
WCDB_SYNTHESIZE(Message, content)
WCDB_SYNTHESIZE(Message, createTime)

WCDB_PRIMARY(Message, messageID)
WCDB_INDEX(Message, "_index", createTime)

@end
