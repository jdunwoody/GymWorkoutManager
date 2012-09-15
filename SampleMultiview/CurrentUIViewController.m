//
//  CurrentUIViewController.m
//  GymApp
//
//  Created by James Dunwoody on 27/08/12.
//
//

#import "CurrentUIViewController.h"
#import "LoadProgramViewController.h"
#import "ReportingViewController.h"
#import "WeightExercise.h"
#import "Set.h"
#import "SlidingPanelContainerViewController.h"
#import "ProgramDataSource.h"

@interface CurrentUIViewController ()

@end

@implementation CurrentUIViewController
@synthesize programNameLabel;
@synthesize exerciseNameLabel;
@synthesize exerciseWeightLabel;
@synthesize exerciseRestLabel;
@synthesize commentLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    [self animateComments];
}
- (void)viewDidAppear:(BOOL)animated
{
    if ([self.programDataSource.program exerciseCount] == 0) {
        [self performSegueWithIdentifier:@"loadProgram" sender:self];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (void)keyboardWasShown:(NSNotification *)aNotification {
    if ( keyboardShown )
        return;
    
    //    if ( ( activeField != inputAmount ) && ( activeField != inputAge ) ) {
    NSDictionary *info = [aNotification userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    NSTimeInterval animationDuration = 0.300000011920929;
    CGRect frame = self.view.frame;
    frame.origin.y -= keyboardSize.height-44;
    frame.size.height += keyboardSize.height-44;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
    
    viewMoved = YES;
    //    }
    
    keyboardShown = YES;
}

- (void)keyboardWasHidden:(NSNotification *)aNotification {
    if ( viewMoved ) {
        NSDictionary *info = [aNotification userInfo];
        NSValue *aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
        CGSize keyboardSize = [aValue CGRectValue].size;
        
        NSTimeInterval animationDuration = 0.300000011920929;
        CGRect frame = self.view.frame;
        frame.origin.y += keyboardSize.height-44;
        frame.size.height -= keyboardSize.height-44;
        [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
        [UIView setAnimationDuration:animationDuration];
        self.view.frame = frame;
        [UIView commitAnimations];
        
        viewMoved = NO;
    }
    
    keyboardShown = NO;
}

- (void) animateComments
{
    [UIView animateWithDuration:1.0 delay: 0
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
                            
                            self.commentLabel.alpha = 0.0;
                        }
                     completion:nil];
    
    
    //                         self.comment.text = [words objectAtIndex:i];
    //                         i = i + 1;
    //                         i = i % [words count];
    
    //    NSArray *words = [self.comment.text componentsSeparatedByString:@" "];
    //    int i =0;
    //
    //    self.comment.alpha = 0.0;
    //
    //    [UIView beginAnimations:@"Fade-in" context:NULL];
    //    [UIView setAnimationRepeatCount:HUGE_VALF];
    //    [UIView setAnimationDuration:1.0];
    //    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //    [UIView setAnimationRepeatAutoreverses:TRUE];
    //    self.comment.alpha = 1.0;
    //    self.comment.text = [words objectAtIndex:i];
    //    i = i++ % [words count];
    //    NSLog(@"i %i", i);
    //    [UIView commitAnimations];
    //
    
    //    int i =0;
    
    //
    //    [UIView animateWithDuration:1.0 delay:0 options: UIViewAnimation<#(UIViewAnimationOptions)#> animations:animations:^{
    //
    //    } completion: ^(BOOL finished) {
    //
    //    }
    //
    //    [UIView animateWithDuration:1.0  animations:^{
    //        self.comment.alpha = 1;
    //        self.comment.alpha = 0;
    //    } completion:^(BOOL finished) {
    //        [self performSelectorOnMainThread:@selector(performAnimationOfFrameAtIndex:) withObject:[NSNumber numberWithInt:index+1] waitUntilDone:NO];
    //    }];
}

- (void)viewDidUnload
{
    [self setCommentLabel:nil];
    [self setProgramNameLabel:nil];
    [self setExerciseNameLabel:nil];
    [self setExerciseWeightLabel:nil];
    [self setExerciseRestLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)programLoadedWithProgram:(Program *)withProgram
{
    [self.presentedViewController dismissModalViewControllerAnimated:YES];
    self.programDataSource.program = withProgram;
    [self.programDataSource notifyNewProgramObservers];
}

- (void)exerciseIsSelected: (Exercise *)withExercise
{
    [self.programDataSource.program setCurrent: withExercise];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"loadProgram"])
    {
        LoadProgramViewController *vc = [segue destinationViewController];
        
        vc.observer = self;
    }
    //    else if ([[segue identifier] isEqualToString:@"showReporting"]) {
    //        UINavigationController *navController = [segue destinationViewController];
    //        ReportingViewController *reportingController = (ReportingViewController *)[navController topViewController];
    //        [reportingController makeKeyAndVisible];
    //        UINavigationController *nc =reportingViewController.navigationController;
    //        nc. navigationBar.hidden = NO;
    //
    //    }
}

- (IBAction)somethingButtonPressed:(id)sender {
    NSLog(@"Something button pressed");
}

- (void) programLoaded
{
    [self updateView];
}

- (void) updateView
{
    WeightExercise *weightExercise = (WeightExercise *) self.programDataSource.program.currentExercise;
    
    self.commentLabel.text = weightExercise.name;
    self.exerciseNameLabel.text = weightExercise.name;
    self.exerciseWeightLabel.text = [weightExercise currentSet].weightAsDisplayValue;
    self.exerciseRestLabel.text = [[weightExercise currentSet].rest stringValue];
    self.programNameLabel.text = self.programDataSource.program.name;
}

//- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
//{
//
//}

@end
