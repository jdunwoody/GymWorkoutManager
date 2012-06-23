//
//  Gym2000ViewController.m
//  Gym2000AndAwesome
//
//  Created by James on 9/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExerciseViewController.h"
#import "AddExerciseCell.h"
#import "ExerciseCell.h"
#import "Exercise.h"

@interface ExerciseViewController ()

@end

@implementation ExerciseViewController

//@synthesize exercise = _exercise;
@synthesize dataController = _dataController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Exercises";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //    self.slideNavigationViewController.delegate = self;
    //    self.slideNavigationViewController.dataSource = self;
    
    //    self.slideNavigationController.panEnabled = YES;
    
    //    [self.view addSubview:tableViewController.tableView];
    
    exercises = [[NSArray alloc] initWithObjects:@"O/H", @"Fly", @"Press up", @"Sit up", @"Burpee", @"Star jump", @"Bicup curls", @"Squats", @"Other", nil];
    bodyPart = [[NSArray alloc] initWithObjects:@"Full body",@"Legs",@"Arms",@"Core",@"Bicep", @"Tricep", @"Shoulder", @"Abs", @"Thigh", @"Hamstring", @"Calf", nil];
    intensity = [[NSArray alloc] initWithObjects:@"Aerobic Light", @"Aerobic Medium", @"Aerobic Intense", @"Anaerobic Light", @"Anaerobic Medium", @"Anaerobic Intense", nil];
    
    sets = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < 20; i++) {
        [sets addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    reps = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < 20; i++) {
        [reps addObject:[NSString stringWithFormat:@"%d", i]];
    }
    for (NSUInteger i = 25; i <= 50; i+=5) {
        [reps addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    rest = [NSMutableArray arrayWithObjects:@"10s", @"20s", @"30s", nil];
    for (NSUInteger i = 1; i <= 20; i++) {
        [rest addObject:[NSString stringWithFormat:@"%dmin", i]];
    }
    
    weight = [[NSMutableArray alloc]init ];
    for (NSUInteger i = 1; i <= 20; i++) {
        [weight addObject:[NSString stringWithFormat:@"%dkg", i]];
    }
    for (NSUInteger i = 25; i < 50; i+=5) {
        [weight addObject:[NSString stringWithFormat:@"%dkg", i]];
    }
    for (NSUInteger i = 50; i <= 150; i+=10) {
        [weight addObject:[NSString stringWithFormat:@"%dkg", i]];
    }
    
}

- (void)viewDidUnload
{
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
        static NSString *CellIdentifier = @"ExerciseCell";
        ExerciseCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        [[cell name] setText: exercise.name];
        [[cell reps] setText: [NSString stringWithFormat:@"%d", exercise.reps]];
        //        [[cell sets] setText: [NSString stringWithFormat:@"%d", exercise.sets]];
        [[cell rest] setText: [NSString stringWithFormat:@"%@ Rest", exercise.rest == nil ? @"No" : exercise.rest]];
        [[cell weights] setText: [NSString stringWithFormat:@"%dkg", exercise.weights]];
        [[cell type] setText: exercise.isSingle ? @"Single" : @"Super"];
        //        cell.indentationLevel = 50;
        //        cell.indentationWidth = 50;
        return cell;
        
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

// [pickerView reloadComponent]

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

// Picker functions

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 7;
}

//UIViewAutoresizingFlexibleWidth

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    switch(component) {
        case 0: return 150.0f;
        case 1: return 44.0f;
        case 2: return 150.0f;
        case 3: return 44.0f;
        case 4: return 88.0f;
        case 5: return 200.0f;
        case 6: return 88.0f;
        default: return 22.0f;
    }
    
    //NOT REACHED
    return 22;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 6:
            return weight.count;
        case 5:
            return intensity.count;
        case 4:
            return rest.count;
        case 3:
            return sets.count;
        case 2:
            return bodyPart.count;
        case 1:
            return reps.count;
        case 0:
        default:
            return exercises.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 6:
            return [weight objectAtIndex:row];
        case 5:
            return [intensity objectAtIndex:row];
        case 4:
            return [rest objectAtIndex:row];
        case 3:
            return [sets objectAtIndex:row];
        case 2:
            return [bodyPart objectAtIndex:row];
        case 1:
            return[reps objectAtIndex:row];
        case 0:
        default:
            return [exercises objectAtIndex:row];
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

@end

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
