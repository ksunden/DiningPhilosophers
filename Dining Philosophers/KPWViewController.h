//
//  KPWViewController.h
//  Dining Philosophers
//
//  Created by Kyle Sunden on 2/25/14.
//  Copyright (c) 2014 KyleSunden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPWPhilosopher.h"

@interface KPWViewController : UIViewController

@property (nonatomic, weak) IBOutlet KPWPhilosopher *phil1;
@property (nonatomic, weak) IBOutlet KPWPhilosopher *phil2;
@property (nonatomic, weak) IBOutlet KPWPhilosopher *phil3;
@property (nonatomic, weak) IBOutlet KPWPhilosopher *phil4;
@property (nonatomic, weak) IBOutlet KPWPhilosopher *phil5;



@end
