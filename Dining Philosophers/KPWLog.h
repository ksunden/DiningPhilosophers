//
//  KPWLog.h
//  Dining Philosophers
//
//  Created by Kyle Sunden on 3/2/14.
//  Copyright (c) 2014 KyleSunden. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol KPWLogDelegate

-(void) logUpdated;

@end


@interface KPWLog : NSObject

@property (nonatomic, strong) NSMutableString *logString;
@property (nonatomic, strong) id <KPWLogDelegate> delegate;
-(id) initWithDelegate:(id<KPWLogDelegate>) del;
-(void) updateLog:(NSString *) stg;

@end
