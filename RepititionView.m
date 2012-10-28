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
        [self.layer setBorderWidth:2.0];
        [self.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
    }
    return self;
}

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