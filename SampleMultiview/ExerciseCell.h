//
//  InactiveExercise.h
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exercise.h"

@interface ExerciseCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *name;
@property (nonatomic, strong) IBOutlet UILabel *reps;
@property (nonatomic, strong) IBOutlet UILabel *bodyPart;
@property (nonatomic, strong) IBOutlet UILabel *rest;
@property (nonatomic, strong) IBOutlet UILabel *weight;
@property (nonatomic, strong) IBOutlet UILabel *category;
@property (nonatomic, strong) IBOutlet UILabel *intensity;
@property (nonatomic, strong) IBOutlet UILabel *editingMode;
@property (nonatomic, strong) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *currentExerciseIndicator;
@property (nonatomic, strong) Exercise *exercise;
@property (weak, nonatomic) IBOutlet UIButton *makeSuperSet;
@property (weak, nonatomic) IBOutlet UIButton *unmakeSuperSet;
@property (weak, nonatomic) IBOutlet UIImageView *weightImage;
@property (weak, nonatomic) IBOutlet UIImageView *repsImage;

- (IBAction)makeSuperSet:(id)sender;
- (IBAction)unmakeSuperSet:(id)sender;

@end
