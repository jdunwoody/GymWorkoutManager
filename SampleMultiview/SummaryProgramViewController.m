//
//  ProgramViewController.m
//  GymApp
//
//  Created by James Dunwoody on 31/08/12.
//
//

#import "SummaryProgramViewController.h"
#import "SummaryProgramCell.h"

@interface SummaryProgramViewController ()

@end

@implementation SummaryProgramViewController

@synthesize overlayImage;
@synthesize exercises = _exercises;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.exercises = [NSArray arrayWithObjects:
                      @"warm up",
                      @"running",
                      @"star jumps",
                      @"mega super set",
                      @"cycle",
                      @"warm down",
                      @"stretching",
                      nil];
}

- (void)viewDidUnload
{
    [self setOverlayImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.exercises count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *exercise = [self.exercises objectAtIndex:indexPath.row];
    NSString *cellIdentifier = @"SummaryViewCell";
    
    SummaryProgramCell *cell = (SummaryProgramCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[SummaryProgramCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.name.text = exercise;
    
    return cell;
    
}

- (NSUInteger)countOfList {
    return [self.exercises count];
}

- (NSString *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.exercises objectAtIndex:theIndex];
}


@end
