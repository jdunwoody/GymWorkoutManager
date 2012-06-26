//
//  ExerciseTableDelegate.m
//  SampleMultiview
//
//  Created by James on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExerciseTableDelegate.h"
#import "ExerciseCell.h"
#import "Exercise.h"

@implementation ExerciseTableDelegate

@synthesize dataController = _dataController;

// Table functions

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"title for header in section";
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Exercise *exercise = [self.dataController objectInListAtIndex:indexPath.row];

    static NSString *CellIdentifier = @"ExerciseCell";
    ExerciseCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [[cell name] setText: exercise.name];
    [[cell reps] setText: [exercise.reps stringValue]];
    [[cell rest] setText: exercise.rest];
    [[cell weight] setText: [exercise.weight stringValue]];
    [[cell bodyPart] setText: exercise.bodyPart];
    [[cell intensity] setText: exercise.intensity];
    [[cell category] setText: exercise.category];
    
    //        [[cell sets] setText: [NSString stringWithFormat:@"%d", exercise.sets]];
//    [[cell category] setText: exercise.isSingle ? @"Single" : @"Super"];
    //        cell.indentationLevel = 50;
    //        cell.indentationWidth = 50;
    return cell;
    
    
    //    if (exercise.isAdd) {
    //        static NSString *CellIdentifier = @"AddExerciseCell";
    //        AddExerciseCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //        
    //        [[cell exercisePicker] setDelegate:self];
    //        [[cell exercisePicker] setDataSource:self];
    //        
    //        //        NSString *valueAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    //        //        [[cell category] setText: @"exercise category"];
    //        //        [[cell exerciseLabel] setText:@"exercise label"];
    //        
    //        return cell;    
    //        
    //    } else {
    
    //        @property NSString *type;
    
    //        Exercise *exercise = [self.dataController objectInListAtIndex:indexPath.row];
    //        [[cell reps] setText: [NSString stringWithFormat:@"%d" exercise.reps]];
    //        [[cell bodyPart] setText: exercise.bodyPart];
    //        [cell sizeToFit];
    //        cell.backgroundColor = [UIColor redColor];
    //        cell.backgroundColor = [UIColor colorWithRed:172.0/255.0 green:173.0/255.0 blue:175.0/255.0 alpha:1.0];
    //        [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop]    
    //    NSIndexPath *selectedIndex = [tableView indexPathForSelectedRow];
    //    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Exercise *exercise = [self.dataController objectInListAtIndex:indexPath.row];
    
    
    if (exercise.isAdd) {
        cell.backgroundColor = [UIColor brownColor];  
        
    } else {
        cell.backgroundColor = [UIColor cyanColor];  
        
    }
    //        [cell textColor];
    //    cell.textLabel.textColor = [UIColor brownColor];
    //    cell.backgroundColor = [UIColor lightGrayColor];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    Exercise *exercise = [self.dataController objectInListAtIndex:indexPath.row];
    
    if (exercise.isAdd) {
        return tableView.rowHeight;
    } else {
        //        return 62;
        return 92;
    }
}

-(void) addExerciseWithName:(NSString *)name withReps: (NSString *)reps withRest: (NSString *)rest withWeight: (NSString *)weight withBodyPart: (NSString *)selectedBodyPart withIntensity:(NSString *)selectedIntensity withCategory:(NSString *)selectedCategory
{
    NSLog(@"Delegate received addExercise");
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    Exercise *exercise = [[Exercise alloc] init];
    exercise.name = name;
    exercise.reps = [numberFormatter numberFromString: reps];
    exercise.rest = rest;
    exercise.weight = [numberFormatter numberFromString:weight];
    exercise.bodyPart = selectedBodyPart;
    exercise.intensity = selectedIntensity;
    
    exercise.category = selectedCategory;
    [self.dataController.exercises addObject:exercise];
}
@end
