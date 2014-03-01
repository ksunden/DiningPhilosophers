//
//  KPWPhilosopher.h
//  Dining Philosophers
//
//  Created by Kyle Sunden on 2/25/14.
//  Copyright (c) 2014 KyleSunden. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    THINKING,
    EATING,
    HUNGRY
    }State;

@interface KPWPhilosopher : UIButton

@property (nonatomic, strong) KPWPhilosopher *left;
@property (nonatomic, strong) KPWPhilosopher *right;

@property (nonatomic) NSInteger thinkingTime;
@property (nonatomic) NSInteger hungryTime;
@property (nonatomic) NSInteger eatingTime;

@property (nonatomic) NSInteger philosopherNumber;

@property BOOL hasLeftChopstick;
@property BOOL hasRightChopstick;

@property (nonatomic) State state;

-(void) setUpWithLeft:(KPWPhilosopher *) left right: (KPWPhilosopher *) right number:(NSInteger) philNum;

-(void) requestFood: (NSInteger) amount;
-(void) step;
-(void) releaseChopsticks;

@end
