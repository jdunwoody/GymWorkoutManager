//
//  InactiveExercise.m
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExerciseCell.h"
#import "Exercise.h"

@implementation ExerciseCell

@synthesize name;
@synthesize reps;
@synthesize bodyPart;
@synthesize rest;
@synthesize weight;
@synthesize category;
@synthesize intensity;
@synthesize editingMode = _editingMode;
@synthesize time = _time;
@synthesize currentExerciseIndicator;
@synthesize makeSuperSet;
@synthesize unmakeSuperSet;
@synthesize exercise;

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//    
//    // Configure the view for the selected state
//}

//- (void)setEditing:(BOOL)editing animated:(BOOL)animate
//{
//    return [super setEditing:editing animated:<#animate#>];
//}

//- (void)setEditing:(BOOL)editing animated:(BOOL)animate
//{
//    [super setEditing:editing animated:animate];
// 
//    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:0.1];
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationBeginsFromCurrentState:YES];
//    
//    if(editing){
//        self.editingMode.enabled = YES;
//    }else{
//        self.editingMode.enabled = NO;
//    }
//    
//    [UIView commitAnimations];
//    if (editing == YES) {
//        NSLog(@"Editing mode for cell");
//    }
//}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    if (animated) {
//        // animation code
//        [super setSelected:selected animated:NO];
//        // more animation code
//    } else {
//        [super setSelected:selected animated:NO];
//    }
//}

- (IBAction)makeSuperSet:(id)sender {
    self.exercise.superSet = YES;
    UITableView *tv = (UITableView *) self.superview;
//    [tv ]reloadRowsAtIndexPaths:[[NSArray alloc] initWithObjects:<#(id), ...#>, nil indexPaths withRowAnimation:(UITableViewRowAnimation)animation
    [tv reloadData];
//    [self setNeedsDisplay];
}

- (IBAction)unmakeSuperSet:(id)sender {
    self.exercise.superSet = NO;
    UITableView *tv = (UITableView *) self.superview;
    [tv reloadData];
//    [self setNeedsDisplay];
}

@end
