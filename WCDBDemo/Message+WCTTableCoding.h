//
//  Message+WCTTableCoding.h
//  WCDBDemo
//
//  Created by HomerLynn on 2017/10/11.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

#import "Message.h"
#import <WCDB/WCDB.h>

@interface Message (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(messageID)
WCDB_PROPERTY(content)
WCDB_PROPERTY(createTime)

@end
