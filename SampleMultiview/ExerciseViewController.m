//
//  ExerciseViewController.m
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import "ExerciseViewController.h"
#import "SetElement.h"
#import "Set.h"
#import "Exercise.h"
#import "JustAnIconView.h"

@interface ExerciseViewController ()

@end

@implementation ExerciseViewController
@synthesize weightLabel = _weightLabel;
@synthesize setContainer = _setContainer;
@synthesize exercise = _exercise;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.weightLabel.text = [self.exercise currentSet].weight.stringValue;
}

- (void)viewDidUnload
{
    [self setSetContainer:nil];
    [self setWeightLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (IBAction)addSet:(id)sender
{
    JustAnIconView *just = [[JustAnIconView alloc] initWithFrame:CGRectMake([self.setContainer.subviews count]*65, 0, 65, 65)];
    [self.setContainer addSubview: just];
    
    //    SetElement *setElement = [[SetElement alloc] initWithFrame:CGRectMake([self.setContainer.subviews count]*40, 0, 40, 40)];
    //    [self.setContainer addSubview: setElement];
    //    setElement.backgroundColor = [UIColor redColor];
    
    //    NSLog(@"Number of child elements %i", [self.setContainer.subviews count]);
    
    //    setElement.set = [[Set alloc] initWithReps:[NSNumber numberWithInt:1]];
    //    setElement.frame = CGRectMake([self.setContainer.subviews count]*40, 0, 40, 40);
    //    setElement.reps.text = [self.exercise currentSet].reps.stringValue;
    //    setElement.rest.text = [self.exercise currentSet].rest.stringValue;
    //    setElement.backgroundColor = [UIColor redColor];
    
    //    [self.setContainer addSubview: setElement];
    
    //    for(SetElement *view in self.setContainer.subviews) {
    //        NSLog(@"dimensions %f %f %f %f %@ %@",
    //              view.frame.origin.x,
    //              view.frame.origin.y,
    //              view.frame.size.width,
    //              view.frame.size.height,
    //              view.reps.text,
    //              view.rest.text);
    //    }
}

//- (IBAction)addSet:(id)sender
//{
//    NSLog(@"Number of child elements %i", [self.setContainer.subviews count]);
//
//    SetElement *setElement = [[SetElement alloc] init];
//
//    [[[NSBundle mainBundle] loadNibNamed:@"repititionView" owner:setElement options:nil] objectAtIndex:0];
//
//    //    setElement.set = [[Set alloc] initWithReps:[NSNumber numberWithInt:1]];
//    setElement.frame = CGRectMake([self.setContainer.subviews count]*40, 0, 40, 40);
//    setElement.reps.text = [self.exercise currentSet].reps.stringValue;
//    setElement.rest.text = [self.exercise currentSet].rest.stringValue;
//    setElement.backgroundColor = [UIColor redColor];
//
//    [self.setContainer addSubview: setElement];
//
//    for(SetElement *view in self.setContainer.subviews) {
//        NSLog(@"dimensions %f %f %f %f %@ %@",
//              view.frame.origin.x,
//              view.frame.origin.y,
//              view.frame.size.width,
//              view.frame.size.height,
//              view.reps.text,
//              view.rest.text);
//    }
//}


//- (IBAction)addSet:(id)sender
//{
//    NSLog(@"Number of child elements %i", [self.setContainer.subviews count]);
//
//    SetElement *setElement = [[SetElement alloc] init];
//
//    setElement.set = [[Set alloc] initWithReps:[NSNumber numberWithInt:1]];
//    setElement.frame = CGRectMake([self.setContainer.subviews count]*40, 0, 40, 40);
//    setElement.reps.text = [self.exercise currentSet].reps.stringValue;
//    setElement.rest.text = [self.exercise currentSet].rest.stringValue;
//    setElement.backgroundColor = [UIColor redColor];
//
//    [self.setContainer addSubview: setElement];
//
//    for(SetElement *view in self.setContainer.subviews) {
//        NSLog(@"dimensions %f %f %f %f %@ %@",
//              view.frame.origin.x,
//              view.frame.origin.y,
//              view.frame.size.width,
//              view.frame.size.height,
//              view.reps.text,
//              view.rest.text);
//    }
//}


//    self.setContainer.frame = CGRectMake(self.setContainer.frame.origin.x, self.setContainer.frame.origin.y, 400, 400);
//    NSLog(@"Adding %f %f %f %f",
//          setElement.frame.origin.x,
//          setElement.frame.origin.y,
//          setElement.frame.size.width,
//          setElement.frame.size.height);
//
//    NSLog(@"to %f %f %f %f",
//          self.setContainer.frame.origin.x,
//          self.setContainer.frame.origin.y,
//          self.setContainer.frame.size.width,
//          self.setContainer.frame.size.height);
//
//    for (UIView *subview in [self.setContainer subviews]) {
//        NSLog(@"Adding %f %f %f %f",
//              subview.frame.origin.x,
//              subview.frame.origin.y,
//              subview.frame.size.width,
//              subview.frame.size.height);
//    }


@end
