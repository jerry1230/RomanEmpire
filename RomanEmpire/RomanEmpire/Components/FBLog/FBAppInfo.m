//
//  FBAppInfo.m
//  RomanEmpire
//
//  Created by Bird on 2017/9/14.
//  Copyright © 2017年 yueqi. All rights reserved.
//

#import "FBAppInfo.h"

@implementation FBAppInfo

+ (NSString *)appName
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    return app_Name;
}

+ (NSString *)appVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

+ (NSString *)appBuild
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return app_build;
}

+ (NSString *)appUUID
{
    NSUUID *uuid = [[UIDevice currentDevice] identifierForVendor];
    return uuid.UUIDString;
}

+ (NSString *)userDeviceName
{
    NSString *userPhoneName = [[UIDevice currentDevice] name];
    return userPhoneName;
}


+ (NSString *)deviceName
{
    NSString *deviceName = [[UIDevice currentDevice] systemName];
    return deviceName;
}


+ (NSString *)deviceModel
{
    NSString *phoneModel = [[UIDevice currentDevice] model];
    return phoneModel;
}

+ (NSString *)localDeviceModel
{
    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
    return localPhoneModel;
}

+ (NSString *)deviceOSVersion
{
    NSString* osVersion = [[UIDevice currentDevice] systemVersion];
    return osVersion;
}
@end
