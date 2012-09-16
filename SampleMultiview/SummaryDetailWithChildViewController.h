//
//  SummaryDetailWithChildViewController.h
//  GymApp
//
//  Created by James Dunwoody on 15/09/12.
//
//

#import <UIKit/UIKit.h>
#import "CurrentProgramObserver.h"
#import "ProgramLoadObserver.h"
#import "CurrentSummaryObserver.h"

@class ProgramDataSource;

@interface SummaryDetailWithChildViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ProgramLoadObserver>

@property (strong, nonatomic) id<CurrentSummaryObserver> currentSummaryObserver;
@property (strong, nonatomic) id<CurrentProgramObserver> programObserver;

@property (strong, nonatomic) ProgramDataSource *programDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *overlay;

@property (weak, nonatomic) IBOutlet UILabel *firstChildLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleChildLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastChildLabel;
@end
