//
//  Gym2000ViewController.m
//  Gym2000AndAwesome
//
//  Created by James on 9/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExerciseViewController.h"
#import "ExerciseCell.h"
#import "Exercise.h"
#import "ExerciseTimer.h"

@interface ExerciseViewController ()

@end

@implementation ExerciseViewController
//@synthesize addExerciseButton;

@synthesize tableDelegate = _tableDelegate;
@synthesize tableView = _tableView;
@synthesize exerciseComponentPicker;
@synthesize categoryButton;
@synthesize elapsedTimeLabel;


//@synthesize exercise = _exercise;

- (void)viewDidLoad
{
    [super viewDidLoad];
    timer = [[ExerciseTimer alloc] initWithLabel:elapsedTimeLabel];
    
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;

    self.title = @"Exercises";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    nameValues = [[NSArray alloc] initWithObjects:@"O/H", @"Fly", @"Press up", @"Sit up", @"Burpee", @"Star jump", @"Bicup curls", @"Squats", @"Other", nil];    
    bodyPartValues = [[NSArray alloc] initWithObjects:@"Full body",@"Legs",@"Arms",@"Core",@"Bicep", @"Tricep", @"Shoulder", @"Abs", @"Thigh", @"Hamstring", @"Calf", nil];
    intensityValues = [[NSArray alloc] initWithObjects:@"Aerobic Light", @"Aerobic Medium", @"Aerobic Intense", @"Anaerobic Light", @"Anaerobic Medium", @"Anaerobic Intense", nil];
    
    setValues = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < 20; i++) {
        [setValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    repValues = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < 20; i++) {
        [repValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
    for (NSUInteger i = 25; i <= 50; i+=5) {
        [repValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    restValues = [NSMutableArray arrayWithObjects:@"10", @"20", @"30", nil];
    for (NSUInteger i = 1; i <= 20; i++) {
        [restValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    weightValues = [[NSMutableArray alloc]init ];
    for (NSUInteger i = 1; i <= 20; i++) {
        [weightValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
    for (NSUInteger i = 25; i < 50; i+=5) {
        [weightValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
    for (NSUInteger i = 50; i <= 150; i+=10) {
        [weightValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

- (void)viewDidUnload
{
//    [self setAddExerciseButton:nil];
    [self setExerciseComponentPicker:nil];
    [self setCategoryButton:nil];
    [self setElapsedTimeLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

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


// [pickerView reloadComponent]

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Picker functions

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 7;
}

//UIViewAutoresizingFlexibleWidth

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    switch(component) {
        case NAME: return 150.0f;
        case REPS: return 44.0f;
        case BODYPART: return 150.0f;
        case SETS: return 44.0f;
        case REST: return 88.0f;
        case INTENSITY: return 200.0f;
        case WEIGHT: 
        default: return 88.0f;
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case WEIGHT:
            return weightValues.count;
        case INTENSITY:
            return intensityValues.count;
        case REST:
            return restValues.count;
        case SETS:
            return setValues.count;
        case BODYPART:
            return bodyPartValues.count;
        case REPS:
            return repValues.count;
        case NAME:
        default:
            return nameValues.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case WEIGHT:
            return [weightValues objectAtIndex:row];
        case INTENSITY:
            return [intensityValues objectAtIndex:row];
        case REST:
            return [restValues objectAtIndex:row];
        case SETS:
            return [setValues objectAtIndex:row];
        case BODYPART:
            return [bodyPartValues objectAtIndex:row];
        case REPS:
            return[repValues objectAtIndex:row];
        case NAME:
        default:
            return [nameValues objectAtIndex:row];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
//    if ([segue.identifier isEqualToString:@"AddExercise"]) {
//        AddTypeViewController *destination = (AddTypeViewController *)segue.destinationViewController;
//        
//        destination.addExerciseViewControllerDelegate = self;
//        
//        //        PickerTestViewController *asker = (PickerTestViewController *) segue.destinationViewController;
//        //        asker.delegate = self;
//        //        asker.question = @"What do you want your label to say?";
//        //        asker.answer = @"Label text";
    }

- (IBAction)addExercise:(id)sender {
    NSString *selectedName = [nameValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:NAME]];
    NSString *selectedReps = [repValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:REPS]];
    NSString *selectedWeight = [weightValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:WEIGHT]];
    NSString *selectedRest = [restValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:REST]];
    NSString *selectedBodyPart = [bodyPartValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:BODYPART]];
    NSString *selectedIntensity = [intensityValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:INTENSITY]];
    NSString *selectedCategory = [categoryButton titleForSegmentAtIndex:[categoryButton selectedSegmentIndex]];
    
    [self.tableDelegate addExerciseWithName: selectedName withReps: selectedReps withRest: selectedRest withWeight: selectedWeight withBodyPart: selectedBodyPart withIntensity: selectedIntensity withCategory: selectedCategory];
    
    [self.tableView reloadData];
}

- (IBAction)startTimerPressed:(id)sender {
    [timer start];
}

- (IBAction)pauseTimerPressed:(id)sender {
    [timer pause];
}

- (IBAction)stopTimerPressed:(id)sender {
    [timer stop];
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
    self.tableDelegate.tableView = self.tableView;
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

@end  
    
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
