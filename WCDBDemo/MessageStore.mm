//
//  MessageStore.m
//  WCDBDemo
//
//  Created by HomerLynn on 2017/10/12.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

#import "MessageStore.h"

static NSString *const kDBName = @"wcdb_test.db";
static NSString *const kMessageTable = @"message";

@implementation MessageStore

/// MARK - DB

/// Get "wcdb_test.db" object.
- (WCTDatabase *)getDatabase {
    if ([self isDBExist]) {
        WCTDatabase *database = [[WCTDatabase alloc] initWithPath:[self getDBPath]];
        return database;
    } else {
        WCTDatabase *database = [[WCTDatabase alloc] initWithPath:[self getDBPath]];
        return database;
    }
}

/// Is "wcdb_test.db" has been created.
- (BOOL)isDBExist {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = paths.firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:kDBName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    return result;
}

/// Get message table.
- (WCTTable *)getMessageTable {
    WCTDatabase *database = [self getDatabase];
    /// message table had been created.
    if ([self hasMessageTableCreated]) {
        return [database getTableOfName:kMessageTable withClass:Message.class];
    }
    /// message table not create.
    /// Create message table.
    [database createTableAndIndexesOfName:kMessageTable withClass:Message.class];
    return [database getTableOfName:kMessageTable withClass:Message.class];
}

/// Is message table has been created.
- (BOOL)hasMessageTableCreated {
    WCTDatabase *database = [self getDatabase];
    WCTTable *messageHasCreated = [database getTableOfName:kMessageTable withClass:Message.class];
    return messageHasCreated == nil ? NO : YES;
}

/// Get the DB path.
- (NSString *)getDBPath {
    NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = filePath.firstObject;
    NSString *dbPath = [documentPath stringByAppendingPathComponent:kDBName];
    NSLog(@"DB path is : %@", dbPath);

    return dbPath;
}

/// MARK - ORM

/// Insert Message object to DB.
- (BOOL)insertMessage:(Message *)message {
    WCTTable *messageTable = [self getMessageTable];
    return [messageTable insertObject:message];
}

/// Delete Message object to DB.
- (BOOL)deleteMessageWithID:(int)messageID {
    WCTTable *messageTable = [[self getDatabase] getTableOfName:kMessageTable withClass:Message.class];
    return [[self getDatabase] deleteObjectsFromTable:kMessageTable where:Message.messageID == messageID];
}

/// Update Message object to DB.
- (BOOL)updateMessage:(Message *)message {
    return YES;
}

/// Query Message with 'localID'.
- (Message *)queryMessageWithID:(int)id {
    NSArray<Message *> *messages = [self queryMessages];
    for (int index = 0; index < messages.count; ++index) {
        if (messages[index].messageID == id) {
            return messages[index];
        }
    }
    return nil;
}

/// Query Messages.
- (NSArray<Message *> *)queryMessages {
    return [[self getDatabase] getObjectsOfClass:Message.class fromTable:kMessageTable orderBy:Message.messageID.order()];
}

@end
