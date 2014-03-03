//
//  KPWViewController.m
//  Dining Philosophers
//
//  Created by Kyle Sunden on 2/25/14.
//  Collaborators: Will Reichle, Fayang Pan
//  For Dining Philosophers Project, for Operating Systems class, Winter 2014, Kalamazoo College.
//  Copyright (c) 2014 KyleSunden. All rights reserved.
//

/**
 This class defines the user interface.
 */

#import "KPWViewController.h"
#import "KPWPhilosopher.h"

@interface KPWViewController ()
@property BOOL isRunning;
@end

@implementation KPWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize and set up UI elements
    _log = [[KPWLog alloc]initWithDelegate:self];
    [_phil1 setUpWithLeft:_phil2 right:_phil5 number:1 log:_log];
    [_phil2 setUpWithLeft:_phil3 right:_phil1 number:2 log:_log];
    [_phil3 setUpWithLeft:_phil4 right:_phil2 number:3 log:_log];
    [_phil4 setUpWithLeft:_phil5 right:_phil3 number:4 log:_log];
    [_phil5 setUpWithLeft:_phil1 right:_phil4 number:5 log:_log];
    [_requestSlider setMaximumValue:30];
    [_requestSlider setMinimumValue:1];
    [_requestSlider setValue:5];
    [_sliderVal setText:@"5"];
    
    [_runButton setTitle:@"Run" forState:UIControlStateNormal];
    
    // Schedule runStep to be called every half second
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(runStep) userInfo:Nil repeats:YES];
    [self step];
    _timeStep = 0;
    [_timeStepLabel setText: [NSString stringWithFormat:@"%ld", (long)_timeStep]];
    [_log updateLog:@"Simulation started"];
}

// Increment timestep, step each philosopher, release chopsticks that are finished eating
// Called from other methods and when stepButton is tapped
-(IBAction) step
{
    _timeStep++;
    [_timeStepLabel setText: [NSString stringWithFormat:@"%ld", (long)_timeStep]];
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

// Run a step if the simulation is running
-(void) runStep
{
    if(_isRunning)
    {
        [self step];
    }
}

// Run or pause the simulation
- (IBAction)run:(id)sender {
    _isRunning = !_isRunning;
    if(_isRunning)
    {
        [_runButton setTitle:@"Pause" forState:UIControlStateNormal];
    }else{
        [_runButton setTitle:@"Run" forState:UIControlStateNormal];
    }
}

// Update slider indicator
- (IBAction)sliderChanged:(UISlider *)sender {
    [_sliderVal setText:[NSString stringWithFormat:@"%ld", (long)[sender value]]];
}

// Stop simulation, print stats on philosophers
// Starts simulation if stopped
- (IBAction)stoptapped:(UIButton *)sender {
    _isRunning = FALSE;
    [_runButton setTitle:@"Run" forState:UIControlStateNormal];
    [_runButton setEnabled:![_runButton isEnabled]];
    [_stepButton setEnabled:![_stepButton isEnabled]];
    
    if(![_runButton isEnabled])
    {
        [_log updateLog:[NSString stringWithFormat:@"Philosopher 1\nThinking: %d Hungry: %d Eating: %d", [_phil1 thinkingTime], [_phil1 hungryTime], [_phil1 eatingTime]]];
        [_log updateLog:[NSString stringWithFormat:@"Philosopher 2\nThinking: %d Hungry: %d Eating: %d", [_phil2 thinkingTime], [_phil2 hungryTime], [_phil2 eatingTime]]];
        [_log updateLog:[NSString stringWithFormat:@"Philosopher 3\nThinking: %d Hungry: %d Eating: %d", [_phil3 thinkingTime], [_phil3 hungryTime], [_phil3 eatingTime]]];
        [_log updateLog:[NSString stringWithFormat:@"Philosopher 4\nThinking: %d Hungry: %d Eating: %d", [_phil4 thinkingTime], [_phil4 hungryTime], [_phil4 eatingTime]]];
        [_log updateLog:[NSString stringWithFormat:@"Philosopher 5\nThinking: %d Hungry: %d Eating: %d", [_phil5 thinkingTime], [_phil5 hungryTime], [_phil5 eatingTime]]];
        [sender setTitle:@"Start" forState:UIControlStateNormal];
    }else
    {
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Request food for a philosopher
- (IBAction)philsospherPoked:(KPWPhilosopher *)sender {
    if([sender philosopherState]==THINKING)
    {
        [sender requestFood:(int) [_requestSlider value]];
    }
}

// Update the log text view
-(void)logUpdated
{
    [_logView setText:[_log logString]];
    [_logView scrollRangeToVisible:NSMakeRange([_logView.text length], 0)];
}
@end
