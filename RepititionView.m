//
//  JustAnIconView.m
//  GymApp
//
//  Created by James Dunwoody on 21/09/12.
//
//

#import "RepititionView.h"
#import "ExerciseViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ExerciseDetailViewController.h"

@implementation RepititionView

@synthesize delegate = _delegate;
@synthesize viewController = _viewController;

- (id)initWithFrame:(CGRect)frame withNibName: (NSString *) nibName
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview: [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] objectAtIndex:0]];
        
        [self.layer setCornerRadius:5.0];
        
        //        [[self layer] masksToBounds:YES];
        
        
        [self.layer setBorderWidth:2.0];
        [self.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];   //Adding Border color.
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

//- (IBAction)repTapped:(id)sender {
//    //    NSLog(@"Rep tapped");
//    
//    //    UIView *aView = [[UIView alloc] init];
//    //    [self.delegate showPopoverWithView: self];
//    
//    UIGestureRecognizer *recoginizer = sender;
//    
//    recoginizer.view.backgroundColor = [UIColor blueColor];
//    
//    [self.viewController performSegueWithIdentifier: @"editRep" sender: self];
//    
//    //    RepititionView *repitionView = (RepititionView *) sender;
//    //    EditRepViewController *destination = segue.destinationViewController;
//    //    destination.programDatasource = self.programDatasource;
//    //    destination.exerciseViewController = self;
//    //    destination.set = repitionView.set;
//}
//
//- (IBAction)restTapped:(id)sender {
//    UIGestureRecognizer *recoginizer = sender;
//    recoginizer.view.backgroundColor = [UIColor blueColor];
//    [self.viewController performSegueWithIdentifier: @"editRep" sender: self];
//}


- (IBAction)repTapped:(id)sender {
    UIGestureRecognizer *recoginizer = sender;
    //    recoginizer.view.backgroundColor = [UIColor blueColor];
    [self.viewController showRepPopoverWithView: recoginizer.view withSet: self.set];
}

- (IBAction)restTapped:(id)sender {
    UIGestureRecognizer *recoginizer = sender;
    //    recoginizer.view.backgroundColor = [UIColor blueColor];
    [self.viewController showRestPopoverWithView: recoginizer.view withSet: self.set];
}

- (IBAction)weightTapped:(id)sender {
    UIGestureRecognizer *recoginizer = sender;
    //    recoginizer.view.backgroundColor = [UIColor blueColor];
    [self.viewController showWeightPopoverWithView: recoginizer.view withSet: self.set];
}

@end
