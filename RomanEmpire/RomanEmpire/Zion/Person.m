//
//  Person.m
//  RomanEmpire
//
//  Created by Bird on 2017/8/24.
//  Copyright © 2017年 Flyingbird. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"SELF:%@",NSStringFromClass([self class]));
        NSLog(@"SUPER:%@",NSStringFromClass([super class]));
    }
    return self;
}

- (void)testClassName
{
    NSLog(@"SELF:%@",NSStringFromClass([self class]));
    NSLog(@"SUPER:%@",NSStringFromClass([super class]));
}


@end
