//
//  KPWLog.m
//  Dining Philosophers
//
//  Created by Kyle Sunden on 3/2/14.
//  Collaborators: Will Reichle, Fayang Pan
//  For Dining Philosophers Project, for Operating Systems class, Winter 2014, Kalamazoo College.
//  Copyright (c) 2014 KyleSunden. All rights reserved.
//
/**
 
 This class initializes a delegate and
 
 */
#import "KPWLog.h"

@implementation KPWLog

-(id) initWithDelegate: (id<KPWLogDelegate>) del
{
    self = [self init];
    _delegate = del;
    _logString = [[NSMutableString alloc]initWithString:@""];
    return self;
}

-(void)updateLog:(NSString *)stg
{
    [_logString appendFormat:@"%@\n",stg];
    [_delegate logUpdated];
}

@end
