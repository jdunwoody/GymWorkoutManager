//
//  InactiveExercise.h
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExerciseCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *name;
@property (nonatomic, strong) IBOutlet UILabel *reps;
@property (nonatomic, strong) IBOutlet UILabel *bodyPart;
@property (nonatomic, strong) IBOutlet UILabel *rest;
@property (nonatomic, strong) IBOutlet UILabel *weights;
@property (nonatomic, strong) IBOutlet UILabel *type;
@property (nonatomic, strong) IBOutlet UILabel *intensity;

@end
