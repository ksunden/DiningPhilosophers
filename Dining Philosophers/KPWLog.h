//
//  KPWLog.h
//  Dining Philosophers
//
//  Created by Kyle Sunden on 3/2/14.
//  Collaborators: Will Reichle, Fayang Pan
//  For Dining Philosophers Project, for Operating Systems class, Winter 2014, Kalamazoo College.
//  Copyright (c) 2014 KyleSunden. All rights reserved.
//

/**
 This is the header file for logging the activity.
 */

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
