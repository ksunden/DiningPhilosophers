//
//  KPWPhilosopher.m
//  Dining Philosophers
//
//  Created by Kyle Sunden on 2/25/14.
//  Copyright (c) 2014 KyleSunden. All rights reserved.
//

#import "KPWPhilosopher.h"
@interface KPWPhilosopher()

@property (nonatomic) NSInteger howHungry;

-(BOOL) pickUpLeftChopstick;
-(BOOL) pickUpRightChopstick;

@end

@implementation KPWPhilosopher




-(void) setUpWithLeft:(KPWPhilosopher *)left right:(KPWPhilosopher *)right number:(NSInteger)philNum
{
    [self setLeft:left];
    [self setRight:right];
    [self setPhilosopherNumber:philNum];
    _thinkingTime = 0;
    _hungryTime = 0;
    _eatingTime = 0;
    _hasLeftChopstick = FALSE;
    _hasRightChopstick = FALSE;
    [self setState:THINKING];
}
-(BOOL) pickUpLeftChopstick
{
    if (![_left hasRightChopstick])
    {
        [self setHasLeftChopstick:TRUE];
    }
    return _hasLeftChopstick;
}

-(BOOL) pickUpRightChopstick
{
    if (![_right hasLeftChopstick])
    {
        [self setHasRightChopstick:TRUE];
    }
    return _hasRightChopstick;
}

-(void) requestFood:(NSInteger)amount
{
    [self setState:HUNGRY];
    [self setHowHungry:amount];
}

-(void) step
{
    switch ([self state]) {
        
        case HUNGRY:
            if (_philosopherNumber % 2 == 1)
            {
                if([self pickUpLeftChopstick] && [self pickUpRightChopstick])
                {
                    [self setState:EATING];
                }
            }else{
                if([self pickUpRightChopstick] && [self pickUpLeftChopstick])
                {
                    [self setState:EATING];
                }
            }
            break;

        case EATING:
            _howHungry--;
            if (_howHungry == 0) {
                _eatingTime++;
                _thinkingTime--; // Will add back in later switch;
                [self setState:THINKING];
                //TODO log changes
            }
            break;
        case THINKING:
            break;
                default:
            break;
    }
    
    switch ([self state]) {
            
        case HUNGRY:
            [self setTitle: [NSString stringWithFormat:@"Hungry: %d", _howHungry] forState:UIControlStateNormal];
            [self setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
            _hungryTime++;
            break;
            
        case EATING:
            [self setTitle: [NSString stringWithFormat:@"Eating: %d",_howHungry] forState:UIControlStateNormal];
            [self setTitleColor: [UIColor greenColor] forState:UIControlStateNormal];
            _eatingTime++;
            break;
        case THINKING:
            [self setTitle: @"Thinking" forState:UIControlStateNormal];
            [self setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
            _thinkingTime++;
            break;
        default:
            _thinkingTime++;
            break;
    }

}

-(void) releaseChopsticks
{
    if([self state] == THINKING)
    {
        [self setHasLeftChopstick:FALSE];
        [self setHasRightChopstick:FALSE];
    }
}

@end
