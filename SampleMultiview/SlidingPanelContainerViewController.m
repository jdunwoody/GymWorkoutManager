//
//  SlidingPanelContainerVIewController.m
//  GymApp
//
//  Created by James Dunwoody on 31/08/12.
//
//

#import "SlidingPanelContainerViewController.h"

@interface SlidingPanelContainerViewController ()

@end

@implementation SlidingPanelContainerViewController
@synthesize showMenuSwipeGesture = _showMenuSwipeGesture;
@synthesize hideMenuSwipeGesture = _hideMenuSwipeGesture;
@synthesize showMenuTapGesture = _showMenuTapGesture;
@synthesize hideMenuTapGesture = _hideMenuTapGesture;

@synthesize mainPanel = _mainPanel;
@synthesize slidingPanel = _slidingPanel;
@synthesize slideBar = _slideBar;
@synthesize slidingPanelContainer = _slidingPanelContainer;

@synthesize mainViewController = _mainViewController;
@synthesize expandedSlidingViewController = _expandedSlidingViewController;
@synthesize collapsedSlidingViewController = _collapsedSlidingViewController;

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
    //    self.mainViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + statusBarFrame.size.height);
    [self didMoveToParentViewController: self.mainViewController];
    
    [self addChildViewController: self.collapsedSlidingViewController];
    [self.slidingPanel addSubview: self.collapsedSlidingViewController.view];
    [self didMoveToParentViewController: self.collapsedSlidingViewController];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    
    //    int x = self.view.frame.size.width - 59;
    //    int y = 0;
    //    int width = 59;
    //    int height = self.view.frame.size.height;
    //
    
    //    int width = 247;
    //    self.slidingViewController.view.frame = CGRectMake(self.view.frame.size.height - width + statusBarFrame.size.height, 0, width, self.view.frame.size.height);
    
}

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
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (IBAction)showMenu:(id)sender {
    self.hideMenuSwipeGesture.enabled = true;
    self.hideMenuTapGesture.enabled = true;
    self.showMenuSwipeGesture.enabled = false;
    self.showMenuTapGesture.enabled = false;
    
    NSLog(@"Show menu");
    NSLog(@"hideMenuSwipe %d, hideMenuTap %d, showMenuSwipe %d, showMenuTap %d", (int)self.hideMenuSwipeGesture.enabled, (int)self.hideMenuTapGesture.enabled, (int)self.showMenuSwipeGesture.enabled, (int)self.showMenuTapGesture.enabled);

    [[self.slidingPanel.subviews objectAtIndex:0] removeFromSuperview];
    [self.collapsedSlidingViewController willMoveToParentViewController: nil];
    [self.collapsedSlidingViewController removeFromParentViewController];
    
    [self addChildViewController: self.expandedSlidingViewController];
    [self.slidingPanel addSubview: self.expandedSlidingViewController.view];
    [self didMoveToParentViewController: self.expandedSlidingViewController];

    [UIView animateWithDuration:0.5  animations:^{
        CGRect frame = self.slidingPanelContainer.frame;
        self.slidingPanelContainer.frame = CGRectMake(frame.origin.x - 200 , frame.origin.y, frame.size.width, frame.size.height);
    }];
}

- (IBAction)hideMenu:(id)sender {
    self.hideMenuSwipeGesture.enabled = false;
    self.hideMenuTapGesture.enabled = false;
    self.showMenuSwipeGesture.enabled = true;
    self.showMenuTapGesture.enabled = true;
    
    NSLog(@"Hide menu");
    NSLog(@"hideMenuSwipe %d, hideMenuTap %d, showMenuSwipe %d, showMenuTap %d", (int)self.hideMenuSwipeGesture.enabled, (int)self.hideMenuTapGesture.enabled, (int)self.showMenuSwipeGesture.enabled, (int)self.showMenuTapGesture.enabled);
    
    [UIView animateWithDuration:0.5  animations:^{
        self.slidingPanelContainer.frame = CGRectMake(500, 0, 300, self.slidingPanelContainer.bounds.size.height);
    }];
}

@end
