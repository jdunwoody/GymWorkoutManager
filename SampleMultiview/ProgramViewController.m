//
//  Gym2000ViewController.m
//  Gym2000AndAwesome
//
//  Created by James on 9/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProgramViewController.h"
#import "ExerciseCell.h"
#import "Exercise.h"
#import "ExerciseTimer.h"
#import "ProgramTimer.h"

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ProgramViewController ()

@end

@implementation ProgramViewController

// or this way
//@synthesize addNewExerciseType;
@synthesize programControlsView;
@synthesize programView;
@synthesize hideControlsButton;
@synthesize showControlsButton;
@synthesize addNewExerciseType, addNewBodyPart;
@synthesize tableDelegate, tableView, exerciseComponentPicker, pickerDelegate,categoryButton, weightOrTime;

// NOTES
// are datadetectors such as email on a field necessary Detection:Phone for instance
// use strong for properties
// create @2x versions of all images, but only reference the origin ones in code.
// create a custom image see hour 7 with UIImage *normalImage = [[UIImage imageNamed:@"whiteButton.png"]  stretchableImageWithLeftCapWidth:12.0  topCapHeight:0.0];

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.pickerDelegate = [[ExercisePickerDelegate alloc] initWithWithController: self];
    self.tableDelegate = [[ExerciseTableDelegate alloc] init];
    
    ExerciseDataController *dataController = [[ExerciseDataController alloc] initWithProgram: self.program];
    self.tableDelegate.dataController = dataController;
    
    self.tableDelegate.tableView = self.tableView;
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    self.exerciseComponentPicker.delegate = self.pickerDelegate;
    self.exerciseComponentPicker.dataSource = self.pickerDelegate;
    self.pickerDelegate.categoryButton = self.categoryButton;
    self.pickerDelegate.exerciseComponentPicker = self.exerciseComponentPicker;
    
    //    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"Exercises";
    //    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"carbon_fibre.png"]];
    
    self.view.backgroundColor = self.backgroundColor;
    self.tableView.backgroundColor = self.backgroundColor;
    self.tableDelegate.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"brushed_alu.png"]];

}

//    timer = [[ExerciseTimer alloc] initWithTimerAlertDelegate:(id <TimerAlertDelegate>)self withDirection: CountDown withInitialSeconds:30];

//    SystemSoundID soundId;
//    OSStatus error =
//    CFURLRef *fileUrl = (CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"sound" ofType:@"aif"]];
//    AudioServicesCreateSystemSoundID(fileUrl, &systemSoundID);


//	player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]] error:nil];
//
//	[player prepareToPlay];


- (IBAction)weightOrTimeChosen:(id)sender {
    if ([self.weightOrTime selectedSegmentIndex] == 0) {
        [self.pickerDelegate weightOrTimeChosen:ExerciseWeightMode];
    } else {
        [self.pickerDelegate weightOrTimeChosen:ExerciseTimeMode];
    }
}

- (void)viewDidUnload
{
    // MAKE sure all properties are deallocated
    [self setExerciseComponentPicker:nil];
    [self setAddNewExerciseType:nil];
    [self setAddNewBodyPart:nil];
    [self setAddNewBodyPart:nil];
    [self setProgramControlsView:nil];
    [self setHideControlsButton:nil];
    [self setShowControlsButton:nil];
    [self setProgramView:nil];
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //    return YES;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        //        return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(void) updateSelectedRow
{
    NSIndexPath *selectedRow = [self.tableView indexPathForSelectedRow];
    
    if (selectedRow != nil) {
        Exercise *exercise = [self.pickerDelegate selectedPickerExercise];
        [self.tableDelegate updateRowWithExercise:exercise withRow:selectedRow.row];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showProgram"]) {
//        ProgramViewController *destination = (ProgramViewController *)segue.destinationViewController;
        
//        destination.addExerciseViewControllerDelegate = self;
        
        
        //    ExerciseTableDelegate *tableDelegate = [[ExerciseTableDelegate alloc] init];
        //    ExerciseDataController *dataController = [[ExerciseDataController alloc] initWithProgramStatus:exerciseViewController];
        //    ExercisePickerDelegate *pickerDelegate = [[ExercisePickerDelegate alloc] initWithWithController:exerciseViewController];
        
        //    tableDelegate.dataController = dataController;
        //    exerciseViewController.tableDelegate = tableDelegate;
        //    exerciseViewController.pickerDelegate = pickerDelegate;

        
        //        //        PickerTestViewController *asker = (PickerTestViewController *) segue.destinationViewController;
        //        //        asker.delegate = self;
        //        //        asker.question = @"What do you want your label to say?";
        //        asker.answer = @"Label text";
    }
}

- (IBAction)addExercise:(id)sender {
    Exercise *exercise = [self.pickerDelegate selectedPickerExercise];
    
    [self.tableDelegate addExerciseWithExercise:exercise];
    [self.tableView reloadData];
}

- (IBAction)addNewBodyPart:(id)sender {
    [self.pickerDelegate addBodyPartWithBodyPart: self.addNewBodyPart.text];
    self.addNewBodyPart.text = nil;
    //    [sender resignFirstResponder];
}

- (IBAction)addNewExerciseType:(id)sender {
    [self.pickerDelegate addNameWithName: self.addNewExerciseType.text];
    self.addNewExerciseType.text = nil;
    //    [self.addNewExerciseType resignFirstResponder];
    //    [sender endEditing];
    //    [sender resignFirstResponder];
}

- (IBAction)hideKeyboard:(id)sender
{
    [sender resignFirstResponder];
}

//- (void)setEditing:(BOOL)editing animated:(BOOL)animate
//{
//    if (editing == YES) {
//        NSLog(@"Editing mode for table");
//    }
//}

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewCellEditingStyleDelete;
////    return UITableViewCellEditingStyleInsert;
//}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
    
    //    if (editing) {
    //        addButton.enabled = NO;
    //    } else {
    //        addButton.enabled = YES;
    //    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
//{
//    [self.tableDelegate deleteWithIndexPaths:indexPaths];
//    [self.tableView reloadData];
//}

- (IBAction)randomiseBodyPart:(id)sender {
    [self.pickerDelegate randomiseBodyPart:sender];
}

- (IBAction)randomiseExercise:(id)sender{
    [self.pickerDelegate randomiseExercise:sender];
}

- (IBAction) randomiseIntensity:(id)sender
{
    [self.pickerDelegate randomiseIntensity:sender];
}

- (IBAction) randomiseWeight:(id)sender
{
    [self.pickerDelegate randomiseWeight:sender];
}

- (IBAction) randomiseRest:(id)sender
{
    [self.pickerDelegate randomiseRest:sender];
}

- (IBAction) randomiseReps:(id)sender
{
    [self.pickerDelegate randomiseReps:sender];
}

- (IBAction) randomiseSets:(id)sender
{
    [self.pickerDelegate randomiseSets:sender];
}

@end

//- (IBAction)hideControls:(id)sender {
//    self.programView.frame = CGRectMake(self.programView.frame.origin.x,
//                                        self.programView.frame.origin.y,
//                                        self.programView.bounds.size.width,
//                                        self.view.bounds.size.height - self.currentView.bounds.size.height - 10);
//    self.hideControlsButton.hidden = true;
//    self.showControlsButton.hidden = false;
//
//    NSTimeInterval animationDuration = 0.5; /* determine length of animation */;
//    CGRect currentFrame =self.programControlsView.frame;
//    CGRect newFrameSize = CGRectMake(currentFrame.origin.x,
//                                     self.view.bounds.size.height - self.currentView.bounds.size.height - 10,
//                                     self.programView.bounds.size.width,
//                                     self.programView.bounds.size.height);
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:animationDuration];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    self.programControlsView.frame = newFrameSize;
//    [UIView commitAnimations];
//
//}
//
//- (IBAction)showControls:(id)sender {
//    self.programView.frame = CGRectMake(self.programView.frame.origin.x,
//                                        0,
//                                        self.programView.bounds.size.width,
//                                        self.view.bounds.size.height);
//    self.hideControlsButton.hidden = false;
//    self.showControlsButton.hidden = true;
//
//    NSTimeInterval animationDuration = 0.5; /* determine length of animation */;
//    CGRect currentFrame =self.programControlsView.frame;
//    CGRect newFrameSize = CGRectMake(currentFrame.origin.x,
//                                     self.view.bounds.size.height - self.currentView.bounds.size.height - 10,
//                                     self.programView.bounds.size.width,
//                                     self.programView.bounds.size.height);
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:animationDuration];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    self.programControlsView.frame = newFrameSize;
//    [UIView commitAnimations];
//
//
//}
//
//    NSLog(@"self.view.frame.size.height %f - self.currentView.frame.size.height %f - 50",  self.view.bounds.size.height, self.currentView.bounds.size.height);

//    NSLog(@"self.programView.frame.origin.x %f, self.programView.frame.origin.y %f, self.programView.frame.size.width %f, self.view.frame.size.height - self.currentView.frame.size.height - %f ",
//          self.programView.frame.origin.x,
//          self.programView.frame.origin.y,
//          self.programView.bounds.size.width,
//          self.view.bounds.size.height - self.currentView.bounds.size.height - 10);
//




//- (IBAction)makeSuperSet:(id)sender {
//    UIButton *btn = (UIButton *)sender;
//
//
//}

// MW Slider Stuff
//
//- (IBAction) showEditStuff:(id)sender
//{
//    [self.slideNavigationViewController slideWithDirection:MWFSlideDirectionRight];
//}
//
//- (IBAction) hideEditStuff:(id)sender
//{
//    [self.slideNavigationViewController slideWithDirection:MWFSlideDirectionNone];
//}
//
//- (NSInteger) slideNavigationViewController:(MWFSlideNavigationViewController *)controller
//                   distanceForSlideDirecton:(MWFSlideDirection)direction
//                        portraitOrientation:(BOOL)portraitOrientation
//{
//    if (portraitOrientation)
//    {
//        return 180;
//    }
//    else
//    {
//        return 100;
//    }
//}
//
//- (UIViewController *) slideNavigationViewController:(MWFSlideNavigationViewController *)controller
//                      viewControllerForSlideDirecton:(MWFSlideDirection)direction
//{
//    [self performSegueWithIdentifier:@"AddExercise" sender:self];
//
////    PickerTestViewController * menuCtl = ...; // alloc and init your controller
//    return nil; //menuCtl;
//}

//
//    NSUInteger row = indexPath.row;
//    if (row != NSNotFound)
//    {
//        // Create the view controller and initialize it with the
//        // next level of data.
//        MyViewController *viewController = [[MyViewController alloc]
//                                            initWithTable:tableView andDataAtIndexPath:indexPath];
//        [[self navigationController] pushViewController:viewController
//                                               animated:YES];
//    }

//}
//
//- (void)addItemViewController:(AddTypeViewController *)controller didFinishEnteringItem:(NSString *)item
//{
//    NSLog(@"This was returned from AddExerciseViewController %@",item);
//}
//
//- (IBAction)makeSuperSetButtonPressed:(id)sender
//{
//    NSLog(@"make super set pressed");
//
//    ExerciseCell *cell = (ExerciseCell*)[sender superview];
//    cell.backgroundColor = [UIColor yellowColor];
//
//    NSIndexPath *pathToCell = [self.tableView indexPathForCell:cell];
//    NSInteger row = pathToCell.row;
//
//    [self.dataController makeSuperSetForRow: row];
//
//    //    [self rel
//    //    UITableViewCell *owningCell = (UITableViewCell*)[sender superview];
//    //    cell.indentationLevel = 1;
//    //    cell.indentationLevel = 50;
//    //    cell.indentationWidth = 50;
//    //    NSLog(@"Owning cell indentation level %@", [owningCell indentationLevel]);
//    //    owningCell.indentationLevel = 2;
//    //    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)[[sender superview] superview]];
//    //    NSInteger section = indexPath.section;
//}

//- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSInteger retValue=1;
//    //Store the indent value in a dictionary in your row or implement appropriate logic
//    NSDictionary *dict=[self.dataRowsArray objectAtIndex:indexPath.row];
//    retValue=[[dict valueForKey:@"indent"] intValue];//return the indent
//}
//return retValue;
//}
//
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    float indentPoints = self.indentationLevel * self.indentationWidth;
//    self.contentView.frame = CGRectMake(indentPoints,
//                                        self.contentView.frame.origin.y,self.contentView.frame.size.width - indentPoints,self.contentView.frame.size.height);
//}

//- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    self.selectedName = names objectAtIndex:row;
//
//    NSLog(@"Selected Color: %@. Index of selected color: %i", [arrayColors objectAtIndex:row], row);
//}
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    return view;
//}

//    NSUInteger numComponents = [[exerciseComponentPicker dataSource] numberOfComponentsInPickerView:self.exerciseComponentPicker];

//    NSMutableString * text = [NSMutableString string];
//    for(NSUInteger i = 0; i < numComponents; ++i) {
//        NSUInteger selectedRow = [exerciseComponentPicker selectedRowInComponent:i];

//        NSString *title = [[exerciseComponentPicker delegate] pickerView:exerciseComponentPicker titleForRow:selectedRow forComponent:exerciseComponentPicker];
//
//        NSString *title = [[exerciseComponentPicker delegate] pickerView:exerciseComponentPicker titleForRow:selectedRow inComponent:i];
//        [text appendFormat:@"Selected item \"%@\" in component %lu\n", title, i];
//    }

//    NSLog(@"%@", text);
//    [self.tableDelegate

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    if (view != nil) {
//        return view;
//    }
//    UIView *a,*b,*c;
//
//    switch (component) {
//        case 2:
//            a = [bodyPart objectAtIndex:row];
//            return [bodyPart objectAtIndex:row];
//        case 1:
//            b =[reps objectAtIndex:row];
//            return [reps objectAtIndex:row];
//        case 0:
//        default:
//            c= [exercises objectAtIndex:row];
//
//            return [exercises objectAtIndex:row];
//    }
//}
//@end
//    static NSDateFormatter *formatter = nil;
//
//    if (formatter == nil) {
//        formatter = [[NSDateFormatter alloc] init];
//        [formatter setDateStyle:NSDateFormatterMediumStyle];
//    }
//
