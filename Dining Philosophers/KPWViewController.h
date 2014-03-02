//
//  KPWViewController.h
//  Dining Philosophers
//
//  Created by Kyle Sunden on 2/25/14.
//  Copyright (c) 2014 KyleSunden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPWPhilosopher.h"
#import "KPWLog.h"

@interface KPWViewController : UIViewController <KPWLogDelegate>

@property (nonatomic, strong) KPWLog *log;
@property (nonatomic) NSInteger timeStep;

@property (nonatomic, weak) IBOutlet KPWPhilosopher *phil1;
@property (nonatomic, weak) IBOutlet KPWPhilosopher *phil2;
@property (nonatomic, weak) IBOutlet KPWPhilosopher *phil3;
@property (nonatomic, weak) IBOutlet KPWPhilosopher *phil4;
@property (nonatomic, weak) IBOutlet KPWPhilosopher *phil5;
@property (weak, nonatomic) IBOutlet UISlider *requestSlider;
@property (weak, nonatomic) IBOutlet UIButton *runButton;
@property (weak, nonatomic) IBOutlet UIButton *stepButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UITextView *logView;
@property (weak, nonatomic) IBOutlet UILabel *timeStepLabel;
@property (weak, nonatomic) IBOutlet UILabel *sliderVal;

- (IBAction)philsospherPoked:(KPWPhilosopher *)sender;
- (IBAction) step;
- (IBAction)run:(id)sender;
- (IBAction)sliderChanged:(UISlider *)sender;
- (IBAction)stoptapped:(UIButton *)sender;

- (void)logUpdated;

@end
