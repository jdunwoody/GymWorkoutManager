//
//  ExerciseView.h
//  GymApp
//
//  Created by James Dunwoody on 22/08/12.
//
//

#import <UIKit/UIKit.h>

@interface ExerciseView : UIView

@property (strong, nonatomic) IBOutlet UILabel *position;
@property (strong, nonatomic) IBOutlet UILabel *reps;
@property (strong, nonatomic) IBOutlet UILabel *weight;
@property (strong, nonatomic) IBOutlet UILabel *rest;

@end
