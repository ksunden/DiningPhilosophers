//
//  KPWViewController.m
//  Dining Philosophers
//
//  Created by Kyle Sunden on 2/25/14.
//  Copyright (c) 2014 KyleSunden. All rights reserved.
//

#import "KPWViewController.h"
#import "KPWPhilosopher.h"

@interface KPWViewController ()

@end

@implementation KPWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_phil1 setUpWithLeft:_phil2 right:_phil5 number:1];
    [_phil2 setUpWithLeft:_phil3 right:_phil1 number:2];
    [_phil3 setUpWithLeft:_phil4 right:_phil2 number:3];
    [_phil4 setUpWithLeft:_phil5 right:_phil3 number:4];
    [_phil5 setUpWithLeft:_phil1 right:_phil4 number:5];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) step
{
    [_phil1 step];
    [_phil2 step];
    [_phil3 step];
    [_phil4 step];
    [_phil5 step];
    [_phil1 releaseChopsticks];
    [_phil2 releaseChopsticks];
    [_phil3 releaseChopsticks];
    [_phil4 releaseChopsticks];
    [_phil5 releaseChopsticks];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
