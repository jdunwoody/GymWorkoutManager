//
//  SlidingPanelContainerVIewController.h
//  GymApp
//
//  Created by James Dunwoody on 31/08/12.
//
//

#import <UIKit/UIKit.h>

@interface SlidingPanelContainerViewController : UIViewController

@property (strong, nonatomic) UIViewController *mainViewController;
@property (strong, nonatomic) UIViewController *expandedSlidingViewController;
@property (strong, nonatomic) UIViewController *summarySlidingViewController;

@property (weak, nonatomic) IBOutlet UIView *mainPanel;
@property (weak, nonatomic) IBOutlet UIView *slideBar;
@property (weak, nonatomic) IBOutlet UIView *slidingPanelContainer;
@property (weak, nonatomic) IBOutlet UIView *slidingPanel;

- (IBAction)showMenu:(id)sender;
- (IBAction)hideMenu:(id)sender;

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *showMenuSwipeGesture;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *hideMenuSwipeGesture;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *showMenuTapGesture;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *hideMenuTapGesture;

@end
