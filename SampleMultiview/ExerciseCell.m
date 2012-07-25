//
//  InactiveExercise.m
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExerciseCell.h"

@implementation ExerciseCell

@synthesize name = name;
@synthesize reps = _reps;
@synthesize bodyPart = _bodyPart;
@synthesize rest = _rest;
@synthesize weight = _weights;
@synthesize category = _category;
@synthesize intensity = _intensity;
@synthesize editingMode = _editingMode;
@synthesize time = _time;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

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



@end
