//
//  NSString+FBInfo.h
//  RomanEmpire
//
//  Created by Bird on 2017/9/14.
//  Copyright © 2017年 Flyingbird. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(FBInfo)

# pragma mark - APPInfo
// app名称
+ (NSString *)appName;

// app版本
+ (NSString *)appVersion;

// app build版本
+ (NSString *)appBuild;


# pragma mark - DeviceInfo
// 手机序列号
+ (NSString *)deviceUUID;

// 设备名称
+ (NSString *)deviceName;

// 设备型号
+ (NSString *)deviceModel;

// 地方型号（国际化区域名称）
+ (NSString *)localDeviceModel;

// 手机系统版本
+ (NSString *)deviceOSVersion;

// 手机别名： 用户定义的名称
+ (NSString *)userDeviceName;



@end
