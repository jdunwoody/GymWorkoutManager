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

- (IBAction)repTapped:(id)sender {
//    NSLog(@"Rep tapped");
    
    //    UIView *aView = [[UIView alloc] init];
//    [self.delegate showPopoverWithView: self];
   
    UIGestureRecognizer *recoginizer = sender;
    
    recoginizer.view.backgroundColor = [UIColor blueColor];
     [self.viewController performSegueWithIdentifier: @"editRep" sender: self];
   }

@end
