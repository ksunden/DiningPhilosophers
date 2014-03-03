//
//  KPWPhilosopher.m
//  Dining Philosophers
//
//  Created by Kyle Sunden on 2/25/14.
//  Collaborators: Will Reichle, Fayang Pan
//  For Dining Philosophers Project, for Operating Systems class, Winter 2014, Kalamazoo College.
//  Copyright (c) 2014 KyleSunden. All rights reserved.
//

/**
 
 This class defines a philosopher and its actions. We used doubly linked list to connect a philosoper and his/her neighbors.
 
 */

#import "KPWPhilosopher.h"
@interface KPWPhilosopher()

@property (nonatomic) NSInteger howHungry;

-(BOOL) pickUpLeftChopstick;
-(BOOL) pickUpRightChopstick;

@end

@implementation KPWPhilosopher

// Set up a philosopher, linking left and right, giving it a number and a log
-(void) setUpWithLeft:(KPWPhilosopher *)left right:(KPWPhilosopher *)right number:(NSInteger)philNum log:(KPWLog *) log
{
    [self setLog:log];
    [self setLeft:left];
    [self setRight:right];
    [self setPhilosopherNumber:philNum];
    _thinkingTime = -1; // Set to -1 so setup can be completed by calling step before the simulation starts.
    _hungryTime = 0;
    _eatingTime = 0;
    _hasLeftChopstick = FALSE;
    _hasRightChopstick = FALSE;
    [self setPhilosopherState:THINKING];
}

// Pick up the chopstick on the left if available
// Returns TRUE if the philosopher has the chopstick
-(BOOL) pickUpLeftChopstick
{
    if (![_left hasRightChopstick])
    {
        [self setHasLeftChopstick:TRUE];
    }
    return _hasLeftChopstick;
}

// Pick up the chopstick on the right if available
// Returns TRUE if the philosopher has the chopstick
-(BOOL) pickUpRightChopstick
{
    if (![_right hasLeftChopstick])
    {
        [self setHasRightChopstick:TRUE];
    }
    return _hasRightChopstick;
}

// State that a philosopher is hungry
-(void) requestFood:(NSInteger)amount
{
    [_log updateLog:[NSString stringWithFormat:@"%d: Philosopher %ld: %@", (_thinkingTime+_eatingTime+_hungryTime), (long)_philosopherNumber, @"Hungry"]];
    [self setPhilosopherState:HUNGRY];
    [self setHowHungry:amount];
    
    // Update UI
    [self setTitle: [NSString stringWithFormat:@"Hungry: %d", _howHungry] forState:UIControlStateNormal];
    [self setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
    
}

// Main method as each timestamp passes.
-(void) step
{
    // Check if philosopher can eat
    if (_philosopherState == HUNGRY)
    {
        // Odd numbered philosophers pick up left then right
        if (_philosopherNumber % 2 == 1)
        {
            if([self pickUpLeftChopstick] && [self pickUpRightChopstick])
            {
                [self setPhilosopherState:EATING];
                [_log updateLog:[NSString stringWithFormat:@"%d: Philosopher %ld: %@", (_thinkingTime+_eatingTime+_hungryTime), (long)_philosopherNumber, @"Eating"]];
            }
        }else{// Even numbered philosophers pick up right then left
            if([self pickUpRightChopstick] && [self pickUpLeftChopstick])
            {
                [self setPhilosopherState:EATING];
                [_log updateLog:[NSString stringWithFormat:@"%d: Philosopher %ld: %@", (_thinkingTime+_eatingTime+_hungryTime), (long)_philosopherNumber, @"Eating"]];
            }
        }
    }
    
    // Take a bite
    if (_philosopherState == EATING)
    {
        _howHungry--;
        
        // If finished eating, set to THINKING, and ajust timers accordingly
        if (_howHungry == 0) {
            _eatingTime++;
            _thinkingTime--; // Will add back in later switch;
            [self setPhilosopherState:THINKING];
            [_log updateLog:[NSString stringWithFormat:@"%d: Philosopher %ld: %@", (_thinkingTime+_eatingTime+_hungryTime+1), (long)_philosopherNumber, @"Thinking"]];
        }
    }
    
    // Update UI, adjust counters
    switch (_philosopherState) {
            
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

// Release chopsticks, done to prevent multiple philosophers from eating with the
// same chopsticks in one step
-(void) releaseChopsticks
{
    if(_philosopherState == THINKING)
    {
        [self setHasLeftChopstick:FALSE];
        [self setHasRightChopstick:FALSE];
    }
}

@end
