//
//  KPWPhilosopher.h
//  Dining Philosophers
//
//  Created by Kyle Sunden on 2/25/14.//  Collaborators: Will Reichle, Fayang Pan
//  For Dining Philosophers Project, for Operating Systems class, Winter 2014, Kalamazoo College.
//  Copyright (c) 2014 KyleSunden. All rights reserved.
//

/**
 
This is the header file for a philosopher.
 */

#import <Foundation/Foundation.h>
#import "KPWLog.h"

typedef enum {
    THINKING = 0,
    EATING = 1,
    HUNGRY = 2 
    }State;

@interface KPWPhilosopher : UIButton

@property (nonatomic, strong) KPWPhilosopher *left;
@property (nonatomic, strong) KPWPhilosopher *right;

@property (nonatomic) NSInteger thinkingTime;
@property (nonatomic) NSInteger hungryTime;
@property (nonatomic) NSInteger eatingTime;

@property (nonatomic) NSInteger philosopherNumber;
@property (nonatomic, strong) KPWLog *log;

@property BOOL hasLeftChopstick;
@property BOOL hasRightChopstick;

@property State philosopherState;

-(void) setUpWithLeft:(KPWPhilosopher *) left right: (KPWPhilosopher *) right number:(NSInteger) philNum log: (KPWLog *)log;

-(void) requestFood: (NSInteger) amount;
-(void) step;
-(void) releaseChopsticks;

@end
