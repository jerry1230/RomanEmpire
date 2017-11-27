//
//  FBIOManager.h
//  RomanEmpire
//
//  Created by Bird on 2017/9/22.
//  Copyright © 2017年 Flyingbird. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBIOManager : NSObject


//单条数据操作

- (BOOL)insertRecordToTable:(NSString *)name withObj:(id)object;

- (BOOL)deleteRecordInTable:(NSString *)name ByID:(NSString *)value;

- (BOOL)updateRecordInTable:(NSString *)name ByID:(NSString *)value;

- (BOOL)selectRecordInTable:(NSString *)name ByID:(NSString *)value;










- (BOOL)performSql:(NSString *)sql;






@end
