//
//  MessageStore.h
//  WCDBDemo
//
//  Created by HomerLynn on 2017/10/12.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message+WCTTableCoding.h"

@interface MessageStore : NSObject

- (BOOL)insertMessage:(Message *)message;
- (BOOL)deleteMessageWithID:(int)messageID;
- (BOOL)updateMessage:(Message *)message;
- (Message *)queryMessageWithID:(int)id;
- (NSArray<Message *> *)queryMessages;

@end
