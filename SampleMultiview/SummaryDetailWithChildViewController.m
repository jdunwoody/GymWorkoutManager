//
//  SummaryDetailWithChildViewController.m
//  GymApp
//
//  Created by James Dunwoody on 15/09/12.
//
//

#import "SummaryDetailWithChildViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ProgramDataSource.h"
#import "Program.h"
#import "SummaryProgramCell.h"
#import "Exercise.h"
#import "CurrentSummaryObserver.h"

@interface SummaryDetailWithChildViewController ()

@end

@implementation SummaryDetailWithChildViewController
@synthesize firstChildLabel = _firstChildLabel;
@synthesize middleChildLabel = _middleChildLabel;
@synthesize lastChildLabel = _lastChildLabel;
@synthesize tableView = _tableView;
@synthesize currentSummaryObserver = _currentSummaryObserver;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self reloadExercises];
    
    //    self.program = [self tempMakeExampleProgramWithName: @"Sample Program"];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"overlay frame %f %f %f %i",
          self.tableView.frame.origin.x,
          self.tableView.frame.size.height / 2,
          self.tableView.frame.size.width,
          78);
    
    self.overlay.frame = CGRectMake(self.tableView.frame.origin.x,
                                    self.tableView.frame.size.height / 2,
                                    self.tableView.frame.size.width,
                                    78);
}

- (void) reloadExercises
{
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
    //    [self setOverlayImage:nil];
    //    [self setExerciseList:nil];
    [self setTableView:nil];
    [self setFirstChildLabel:nil];
    [self setMiddleChildLabel:nil];
    [self setLastChildLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    NSLog(@"Did move to parent view controller");
}


//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view.
//}
//
//- (void)viewDidUnload
//{
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//}
//
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}
//
//@end


//
//  ViewController.m
//  SampleListViewWithChild
//
//  Created by James Dunwoody on 12/09/12.
//  Copyright (c) 2012 James Dunwoody. All rights reserved.
//
//#import <QuartzCore/QuartzCore.h>
//#import "ViewController.h"
//#import "SampleCell.h"

//@interface ViewController ()
//
//@end
//
//@implementation ViewController
//
//@synthesize firstChildLabel = _childLabel;
//@synthesize results = _results;
//@synthesize tableView = _tableView;
//@synthesize childView = _childView;
//@synthesize overlay = _overlay;


//    for( int i = 0; i < [self.programDataSource.program exerciseCount]; i++) {
//        //    for (Exercise *exercise in self.program.exercises) {
//        UILabel *exerciseLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,i*100,184,92)];
//        exerciseLabel.text = [self.programDataSource.program exerciseAtIndex:i].name;
//        [exe addSubview: exerciseLabel];
//    }
//    [self.exerciseList setContentSize:CGSizeMake(self.exerciseList.frame.size.width, [self.programDataSource.program exerciseCount] * 200)];


//- (Program *) tempMakeExampleProgramWithName: (NSString *) name
//{
//    Program *program = [[Program alloc] initWithName: name];
//
//    int numExercises = 3 + arc4random() % 7;
//    NSArray *exerciseNames = [NSArray arrayWithObjects:
//                              @"Barbell Curls", @"Dumbell Curls", @"Push ups", @"Squats", @"Running on the spot",
//                              @"Burpees", @"Sit ups", @"Tricep dips", @"Pull ups", nil];
//
//    for (int e=0; e< numExercises; e++) {
//        WeightExercise *exercise = [[WeightExercise alloc] init];
//        exercise.name = [exerciseNames objectAtIndex: (arc4random() % [exerciseNames count])];
//        exercise.rest = [NSString stringWithFormat:@"%is", e * 20];
//
//        int numSets = 1 + arc4random() % 5;
//
//        for (int s = 0; s < numSets; s++) {
//            Set *set = [[Set alloc] init];
//            set.weight = [NSNumber numberWithInt:(10 - s) * 6];
//            set.reps = [NSNumber numberWithInt:2 * s + 10];
//            set.rest = [NSNumber numberWithInt:20 - s];
//
//            [exercise.sets addObject:set];
//        }
//        [program addExercise:exercise];
//    }
//    exerciseNames = nil;
//    return program;
//}


// TABLE View stuff

//-scrollscrollViewWillBeginDragging
//-scrollViewDidScroll
// unused
- (void) shouldDisableScrolling
{
    if (self.tableView.contentSize.height < self.tableView.frame.size.height) {
        self.tableView.scrollEnabled = NO;
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showExerciseDetails" sender: self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [self.programDataSource.program exerciseCount];
//}

//- (Exercise *) exerciseAtIndex: (NSInteger) index
//{
//    if (index < 8 || index > [self.programDataSource.program exerciseCount]) {
//        return [[Exercise alloc] init];
//    }
//
//    Exercise *exercise = [self.programDataSource.program exerciseAtIndex:index];
//
//    return exercise;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Exercise *exercise = [self.programDataSource.program exerciseAtIndex:indexPath.row];
//    NSString *cellIdentifier = @"SummaryViewCell";
//    
//    SummaryProgramCell *cell = (SummaryProgramCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    
//    if (cell == nil) {
//        cell = [[SummaryProgramCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//    
//    cell.name.text = exercise.name;
//    
//    return cell;
//}

//- (NSUInteger)countOfList
//{
//    return [self.programDataSource.program exerciseCount];
//}
//
//- (Exercise *)objectInListAtIndex:(NSUInteger)theIndex
//{
//    return [self.programDataSource.program exerciseAtIndex:theIndex];
//}

- (IBAction)menuPlusButton:(id)sender
{
    Exercise *exercise = [[Exercise alloc] init];
    exercise.name = @"newExercise";
    Set *set = [[Set alloc] initWithReps: [NSNumber numberWithInt:2]];
    
    [exercise addSet: set];
//    [self.programDataSource.program addExercise:exercise];
}

- (void) programLoaded
{
    [self reloadExercises];
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    targetContentOffset->y = targetContentOffset->y - fmod(targetContentOffset->y, 45);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    UITableView *tv = (UITableView *) scrollView;
    
    //    SampleCell *middleCell = (SampleCell *) [scrollView.subviews objectAtIndex: middleCellIndex];
    int firstCellIndex  = (scrollView.contentOffset.y + 23) / 45;
    NSUInteger indexes[2];
    indexes[0] = 0;
    indexes[1] = firstCellIndex;
    SummaryProgramCell *firstCell  = (SummaryProgramCell *) [self.tableView cellForRowAtIndexPath: [NSIndexPath indexPathWithIndexes: indexes length:2]];
    self.firstChildLabel.text = firstCell.name.text;
    //    firstCell.label.minimumFontSize = 80;
    NSLog(@"First  %f %f %i", scrollView.frame.size.height, scrollView.contentOffset.y, firstCellIndex);
    
    int middleCellIndex = (scrollView.frame.size.height / 2 + scrollView.contentOffset.y + 23) / 45;
    indexes[0] = 0;
    indexes[1] = middleCellIndex;
    SummaryProgramCell *middleCell = (SummaryProgramCell *) [self.tableView cellForRowAtIndexPath: [NSIndexPath indexPathWithIndexes: indexes length:2]];
    self.middleChildLabel.text = middleCell.name.text;
    //    middleCell.label.minimumFontSize = 80;
    NSLog(@"Middle %f %f %i", scrollView.frame.size.height, scrollView.contentOffset.y, middleCellIndex);
    
    [self.currentSummaryObserver currentSummaryChanged:middleCell.name.text];
    
    int lastCellIndex   = (scrollView.frame.size.height + scrollView.contentOffset.y + 23) / 45;
    indexes[0] = 0;
    indexes[1] = lastCellIndex;
    SummaryProgramCell *lastCell   = (SummaryProgramCell *) [self.tableView cellForRowAtIndexPath: [NSIndexPath indexPathWithIndexes: indexes length:2]];
    self.lastChildLabel.text = lastCell.name.text;
    //    lastCell.label.minimumFontSize = 80;
    NSLog(@"Last   %f %f %i", scrollView.frame.size.height, scrollView.contentOffset.y, lastCellIndex);
    
    //    int pageNumber = scrollView.contentOffset.y / 45;
    //    scrollView
    
    //    int cardIndex = (int)(scrollView.contentOffset.x / scrollView.frame.size.width);
}





//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//
//    NSMutableArray *names = [[NSMutableArray alloc] init];
//
//    int j =0;
//    for(int i=0; i < 8; i++,j++) {
//        [names addObject: [NSString stringWithFormat:@"      (%i)", j]];
//    }
//
//    for (int i=0; i< 40; i++,j++) {
//        [names addObject: [NSString stringWithFormat:@"%i    (%i)",i, j]];
//    }
//
//    for(int i=0; i < 8; i++,j++) {
//        [names addObject: [NSString stringWithFormat:@"      (%i)", j]];
//    }
//
//    self.results = [[NSArray alloc] initWithArray: names];
//}
//
//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//
//    int numCells = self.tableView.frame.size.height / 45;
//
//    self.overlay.frame = CGRectMake(self.tableView.frame.origin.x,
//                                    (numCells / 2) * 45,
//                                    self.tableView.frame.size.width,
//                                    45);
//}

//- (void)viewDidUnload
//{
//    [self setFirstChildLabel:nil];
//    [self setTableView:nil];
//
//    [self setOverlay:nil];
//    [self setChildView:nil];
//    [super viewDidUnload];
//}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [self.results count];
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString *s = [self.results objectAtIndex:indexPath.row];
//
//    NSString *cellIdentifier = @"cell";
//
//    SampleCell *cell = (SampleCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//
//    if (cell == nil) {
//        cell = [[SampleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//
//    cell.label.text = s;
//
//    return cell;
//}

//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
//{
//    int fullNumberOfCells = scrollView.contentOffset.y / 45;
//
//    int remainderToMove = (fullNumberOfCells + 1) * 45;
//
//    [scrollView setContentOffset:CGPointMake(0, remainderToMove) animated: YES];
//}
//


//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    [scrollview ]
//    //    [self.tableView ];
//}

// Add background tile
//    UIImage *bgImage = [UIImage imageNamed:@"embedded_bg.png"];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];

// Add the reference view
//    UIImage *image = [UIImage imageNamed:@"dccp.jpeg"];
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
//    [self.view addSubview:imgView];
//    imgView.center = self.view.center;

//    UIView *imgView = self.childView;
//    imgView.layer.shadowColor = [UIColor blackColor].CGColor;
//    imgView.layer.shadowOpacity = 0.7f;
//    imgView.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
//    imgView.layer.shadowRadius = 5.0f;
//    imgView.layer.masksToBounds = NO;

//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:imgView.bounds];
//    imgView.layer.shadowPath = path.CGPath;

//    [imgView release];

//    CGSize size = self.childView.bounds.size;
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(size.width * 0.33f, size.height * 0.66f)];
//    [path addLineToPoint:CGPointMake(size.width * 0.66f, size.height * 0.66f)];
//    [path addLineToPoint:CGPointMake(size.width * 1.15f, size.height * 1.15f)];
//    [path addLineToPoint:CGPointMake(size.width * -0.15f, size.height * 1.15f)];

//  CGPathRef path = [UIBezierPath bezierPathWithRect:self.childView.bounds].CGPath;
// [self.childView.layer setShadowPath:path];
// self.view.layer.shouldRasterize = NO;
//    self.view.layer.rasterizationScale = [UIScreen mainScreen].scale;


//- (void)loadView {
//	[super loadView];

//    UIView *imgView = self.childView;
//
//	imgView.layer.shadowColor = [UIColor grayColor].CGColor;
//	imgView.layer.shadowOpacity = 0.1f;
//	imgView.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
//	imgView.layer.shadowRadius = 2.0f;
//	imgView.layer.masksToBounds = NO;
//
//    imgView.layer.shadowPath = [self renderTrapezoid:imgView];
//

//    [self drawRect:CGRectMake(50, 50, 400, 300)];
//}

//	imgView.layer.shadowPath = [self renderRect:imgView];
// Add background tile
//	UIImage *bgImage = [UIImage imageNamed:@"embedded_bg.png"];
//	self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
//
// Add the reference view
//	UIImage *image = [UIImage imageNamed:@"dccp.jpeg"];
//	UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
//	[self.view addSubview:imgView];
//	imgView.center = self.view.center;
//imgView.layer.shadowPath = [self renderEllipse:imgView];
//imgView.layer.shadowPath = [self renderPaperCurl:imgView];
//	[imgView release];


- (void)drawRect:(CGRect)rect
{
    CGPoint c = CGPointMake(200,200);
    // Drawing code
    CGContextRef cx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(cx);
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    
    CGFloat comps[] = {1.0,1.0,0.0,1.0,0.0,1.0,0.0,1.0};
    CGFloat locs[] = {0,1};
    CGGradientRef g = CGGradientCreateWithColorComponents(space, comps, locs, 2);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, c.x, c.y);
    CGPathAddLineToPoint(path, NULL, c.x, c.y-100);
    CGPathAddArcToPoint(path, NULL, c.x+100, c.y-100, c.x+100, c.y, 100);
    CGPathAddLineToPoint(path, NULL, c.x, c.y);
    
    CGContextAddPath(cx, path);
    CGContextClip(cx);
    
    CGContextDrawRadialGradient(cx, g, c, 1.0f, c, 320.0f, 0);
    
    CGContextRestoreGState(cx);
    // Do some more drawing may be
}

- (CGPathRef)renderTrapezoid:(UIView*)imgView {
	CGSize size = imgView.bounds.size;
	
	UIBezierPath *path = [UIBezierPath bezierPath];
	[path moveToPoint:CGPointMake(size.width * 0.33f, size.height * 0.66f)];
	[path addLineToPoint:CGPointMake(size.width * 0.66f, size.height * 0.66f)];
	[path addLineToPoint:CGPointMake(size.width * 1.15f, size.height * 1.15f)];
	[path addLineToPoint:CGPointMake(size.width * -0.15f, size.height * 1.15f)];
    
	return path.CGPath;
}


@end
