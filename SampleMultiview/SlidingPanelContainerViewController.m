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
    self.mainViewController.view.frame = CGRectMake(0, 0, [self windowWidth], [self windowHeight]);
    [self.mainViewController didMoveToParentViewController: self];
    
    //    [self addChildViewController: self.collapsedSlidingViewController];
    //    [self.slidingPanel addSubview: self.collapsedSlidingViewController.view];
    //    [self didMoveToParentViewController: self.collapsedSlidingViewController];
    //
    //    [self setPanelPosition: 0];
    
    self.hideMenuSwipeGesture.enabled = false;
    self.hideMenuTapGesture.enabled = false;
    self.showMenuSwipeGesture.enabled = true;
    self.showMenuTapGesture.enabled = true;
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

- (void) setPanelPosition: (int) position
{
    int tabWidth = self.slideBar.frame.size.width;
    
    self.slidingPanelContainer.frame = CGRectMake([self windowWidth] - tabWidth - position, 0, [self windowHeight] + [self statusBarHeight], position);
}

- (int) windowWidth
{
    return [self isLandscape] ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height;
}

- (int) windowHeight
{
    return [self isLandscape] ? [[UIScreen mainScreen] bounds].size.height + [self statusBarHeight]: [[UIScreen mainScreen] bounds].size.width;
}

- (BOOL) isLandscape
{
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
}

- (int) statusBarHeight
{
    UIApplication *application = [UIApplication sharedApplication];
    return MIN(application.statusBarFrame.size.width, application.statusBarFrame.size.height);
}

- (IBAction)showMenu:(id)sender {
    self.hideMenuSwipeGesture.enabled = true;
    self.hideMenuTapGesture.enabled = true;
    self.showMenuSwipeGesture.enabled = false;
    self.showMenuTapGesture.enabled = false;
    
    NSLog(@"Show menu");
    //    NSLog(@"hideMenuSwipe %d, hideMenuTap %d, showMenuSwipe %d, showMenuTap %d", (int)self.hideMenuSwipeGesture.enabled, (int)self.hideMenuTapGesture.enabled, (int)self.showMenuSwipeGesture.enabled, (int)self.showMenuTapGesture.enabled);
    //
    //    [[self.slidingPanel.subviews objectAtIndex:0] removeFromSuperview];
    //    [self.collapsedSlidingViewController willMoveToParentViewController: nil];
    //    [self.collapsedSlidingViewController removeFromParentViewController];
    
        [self addChildViewController: self.summarySlidingViewController];
        [self.slidingPanel addSubview: self.summarySlidingViewController.view];
        [self didMoveToParentViewController: self.summarySlidingViewController];
    
    
    //    self.summarySlidingViewController.view.frame = CGRectMake(0,0, 40,40);
    
    [UIView animateWithDuration:0.5  animations:^{
        [self setPanelPosition: 200];
        //            CGRect frame = self.slidingPanelContainer.frame;
        //            self.slidingPanelContainer.frame = CGRectMake(frame.origin.x - 200 , frame.origin.y, frame.size.width, frame.size.height);
    }];
}

- (IBAction)hideMenu:(id)sender {
    self.hideMenuSwipeGesture.enabled = false;
    self.hideMenuTapGesture.enabled = false;
    self.showMenuSwipeGesture.enabled = true;
    self.showMenuTapGesture.enabled = true;
    
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
    
    [UIView animateWithDuration:0.5  animations:^{
        [self setPanelPosition: 0];
        
        //           CGRect frame = self.slidingPanelContainer.frame;
        //            self.slidingPanelContainer.frame = CGRectMake(frame.origin.x + 200 , frame.origin.y, frame.size.width, frame.size.height);
        
        //        self.slidingPanelContainer.frame = CGRectMake(500, 0, 300, self.slidingPanelContainer.bounds.size.height);
    }];
    
}

@end
