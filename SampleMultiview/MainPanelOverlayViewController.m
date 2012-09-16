//
//  MainPanelOverlayViewController.m
//  GymApp
//
//  Created by James Dunwoody on 15/09/12.
//
//

#import "MainPanelOverlayViewController.h"
#import "Utils.h"

@interface MainPanelOverlayViewController ()

@end

@implementation MainPanelOverlayViewController
@synthesize contentView;
@synthesize mainLabel;

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
	int offset = 40;
    
    self.contentView.frame = CGRectMake(self.view.frame.origin.x + offset,
                                        self.view.frame.origin.y,
                                        self.view.frame.size.width - 2 * offset,
                                        [Utils windowHeight] - 3 * offset);
}

- (void)viewDidUnload
{
    [self setContentView:nil];
    [self setMainLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) currentSummaryChanged:(NSString *)value
{
    self.mainLabel.text = value;
}

@end
