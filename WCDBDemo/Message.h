//
//  Message.h
//  WCDBDemo
//
//  Created by HomerLynn on 2017/10/11.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>

@interface Message : NSObject

@property int messageID;
@property (copy) NSString *content;
@property (retain) NSDate *createTime;

@end
