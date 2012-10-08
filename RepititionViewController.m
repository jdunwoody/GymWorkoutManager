//
//  RepititionViewController.m
//  GymApp
//
//  Created by James Dunwoody on 25/09/12.
//
//

#import "RepititionViewController.h"

@interface RepititionViewController ()

@end

@implementation RepititionViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)repTapped:(id)sender
{
    NSLog(@"rep tapped in controller");
}

- (IBAction)restTapped:(id)sender
{
    NSLog(@"rest tapped in controller");
}

- (void) showRestPopoverWithView: (UIView *)view withSet:(Set *)set
{
}
- (void) showRepPopoverWithView: (UIView *)view withSet:(Set *)set
{
}
- (void) showWeightPopoverWithView: (UIView *)view withSet:(Set *)set
{
//    UIView *aView = [UIView alloc];
    
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController: self];
    popover.popoverContentSize = CGSizeMake(320, 416);
    [popover presentPopoverFromRect:CGRectMake(0,0, 200,200) inView: (UIView *)view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

}

- (void) showPopover:(UIViewController *)viewController withView:(UIView *)targetView withSet:(Set *)set
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editRep"]) {
        
    }
}
@end
