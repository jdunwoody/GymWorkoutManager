//
//  SlidingPanelContainerVIewController.m
//  GymApp
//
//  Created by James Dunwoody on 31/08/12.
//
//

#import "SlidingPanelContainerViewController.h"
#import "Utils.h"

@interface SlidingPanelContainerViewController ()

@end

@implementation SlidingPanelContainerViewController
@synthesize showMenuSwipeGesture = _showMenuSwipeGesture;
@synthesize hideMenuSwipeGesture = _hideMenuSwipeGesture;
@synthesize showMenuTapGesture = _showMenuTapGesture;
@synthesize hideMenuTapGesture = _hideMenuTapGesture;

@synthesize mainPanel = _mainPanel;
@synthesize slidingPanel = _slidingPanel;
@synthesize mainPanelOverlay = _mainPanelOverlay;
@synthesize slideBar = _slideBar;
@synthesize slidingPanelContainer = _slidingPanelContainer;

@synthesize mainViewController = _mainViewController;
@synthesize expandedSlidingViewController = _expandedSlidingViewController;
@synthesize summarySlidingViewController = _collapsedSlidingViewController;

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

    //    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];

    [self addChildViewController: self.mainViewController];
    [self.mainPanel addSubview: self.mainViewController.view];
    self.mainViewController.view.frame = CGRectMake(0, 0, [Utils windowWidth], [Utils windowHeight]);
    [self.mainViewController didMoveToParentViewController: self];

    [self addChildViewController: self.summarySlidingViewController];
    [self.slidingPanel addSubview: self.summarySlidingViewController.view];
    [self.summarySlidingViewController didMoveToParentViewController: self];

    [self addChildViewController: self.mainPanelOverlayViewController];
    [self.mainPanelOverlay addSubview: self.mainPanelOverlayViewController.view];
    [self.mainPanelOverlayViewController didMoveToParentViewController: self];

    [self setPanelPosition: 0];

    self.hideMenuSwipeGesture.enabled = false;
    self.hideMenuTapGesture.enabled = false;
    self.showMenuSwipeGesture.enabled = true;
    self.showMenuTapGesture.enabled = true;
}
//    [self addChildViewController: self.summarySlidingViewController];
//    [self.slidingPanel addSubview: self.summarySlidingViewController.view];
//    //    [self didMoveToParentViewController: self];
//    [self.summarySlidingViewController didMoveToParentViewController: self];
//


//    [self addChildViewController: self.collapsedSlidingViewController];
//    [self.slidingPanel addSubview: self.collapsedSlidingViewController.view];
//    [self didMoveToParentViewController: self.collapsedSlidingViewController];
//
//    [self setPanelPosition: 0];


//    [self addChildViewController: self.summarySlidingViewController];
//    [self.mainPanel addSubview: self.summarySlidingViewController.view];
//    [self.summarySlidingViewController didMoveToParentViewController: self];



- (void)viewDidUnload
{
    [self setMainPanel:nil];
    [self setSlidingPanel:nil];
    [self setSlideBar:nil];
    [self setSlidingPanelContainer:nil];
    [self setShowMenuSwipeGesture:nil];
    [self setHideMenuSwipeGesture:nil];
    [self setShowMenuTapGesture:nil];
    [self setHideMenuTapGesture:nil];
    [self setMainPanelOverlay:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void) setPanelPosition: (int) position
{
    int tabWidth = self.slideBar.frame.size.width;
    int windowWidth = 1024; //[self windowWidth];
    int x =  windowWidth - tabWidth - position;
    int y = 0;
    int width = self.slidingPanelContainer.frame.size.width; //[self windowHeight] + [self statusBarHeight];
    int height = self.slidingPanelContainer.frame.size.height; //position;

    self.slidingPanelContainer.frame = CGRectMake(x, y, width, height);

    if (position == 0) {
        self.mainPanelOverlay.hidden = YES;
    } else {
        self.mainPanelOverlay.hidden = NO;
        self.mainPanelOverlay.frame = CGRectMake(0, 0, windowWidth - tabWidth - position, height);
    }
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers{
    return YES;
}

- (IBAction)showMenu:(id)sender {
    self.hideMenuSwipeGesture.enabled = true;
    self.hideMenuTapGesture.enabled = true;
    self.showMenuSwipeGesture.enabled = false;
    self.showMenuTapGesture.enabled = false;

    NSLog(@"Show menu");

    [self setPanelPosition: 188 + 28];
}

- (IBAction)hideMenu:(id)sender {
    self.hideMenuSwipeGesture.enabled = false;
    self.hideMenuTapGesture.enabled = false;
    self.showMenuSwipeGesture.enabled = true;
    self.showMenuTapGesture.enabled = true;

    [self setPanelPosition: 0];
}

//    [self addChildViewController: self.summarySlidingViewController];
//    [self.slidingPanel addSubview: self.summarySlidingViewController.view];
//    [self.summarySlidingViewController didMoveToParentViewController: self];

//    [self setPanelPosition: 700];

//    [self addChildViewController: self.mainViewController];
//    [self.mainPanel addSubview: self.mainViewController.view];
//    self.mainViewController.view.frame = CGRectMake(0, 0, [self windowWidth], [self windowHeight]);
//
//    [self setPanelPosition: 188 + 28];

//self.summarySlidingViewController.view.frame.size.width];

//    [self addChildViewController: self.mainViewController];
//    [self.mainPanel addSubview: self.mainViewController.view];
//    self.mainViewController.view.frame = CGRectMake(0, 0, [self windowWidth], [self windowHeight]);
//    [self.mainViewController didMoveToParentViewController: self];

//    NSLog(@"hideMenuSwipe %d, hideMenuTap %d, showMenuSwipe %d, showMenuTap %d", (int)self.hideMenuSwipeGesture.enabled, (int)self.hideMenuTapGesture.enabled, (int)self.showMenuSwipeGesture.enabled, (int)self.showMenuTapGesture.enabled);
//
//    [[self.slidingPanel.subviews objectAtIndex:0] removeFromSuperview];
//    [self.collapsedSlidingViewController willMoveToParentViewController: nil];
//    [self.collapsedSlidingViewController removeFromParentViewController];

//    NSArray *children = [self childViewControllers];

//    self.summarySlidingViewController.view.frame = CGRectMake(0,0, 40,40);

//    [UIView animateWithDuration:0.5  animations:^{
//            CGRect frame = self.slidingPanelContainer.frame;
//            self.slidingPanelContainer.frame = CGRectMake(frame.origin.x - 200 , frame.origin.y, frame.size.width, frame.size.height);
//    }];


//    NSLog(@"Hide menu");
//    NSLog(@"hideMenuSwipe %d, hideMenuTap %d, showMenuSwipe %d, showMenuTap %d", (int)self.hideMenuSwipeGesture.enabled, (int)self.hideMenuTapGesture.enabled, (int)self.showMenuSwipeGesture.enabled, (int)self.showMenuTapGesture.enabled);
//
//    [[self.slidingPanel.subviews objectAtIndex:0] removeFromSuperview];
//    [self.expandedSlidingViewController willMoveToParentViewController: nil];
//    [self.expandedSlidingViewController removeFromParentViewController];
//
//    [self addChildViewController: self.summarySlidingViewController];
//    [self.slidingPanel addSubview: self.summarySlidingViewController.view];
//    [self didMoveToParentViewController: self.summarySlidingViewController];

//    [UIView animateWithDuration:0.5  animations:^{

//           CGRect frame = self.slidingPanelContainer.frame;
//            self.slidingPanelContainer.frame = CGRectMake(frame.origin.x + 200 , frame.origin.y, frame.size.width, frame.size.height);

//        self.slidingPanelContainer.frame = CGRectMake(500, 0, 300, self.slidingPanelContainer.bounds.size.height);
//    }];



@end
