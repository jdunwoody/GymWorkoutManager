#import <UIKit/UIKit.h>
#import "CurrentProgramObserver.h"
#import "ProgramLoadObserver.h"

@class Program;
@class ProgramDataSource;

@interface SummaryProgramViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ProgramLoadObserver>

//@property (weak, nonatomic) IBOutlet UIView *overlayImage;
//@property (weak, nonatomic) IBOutlet UIScrollView *exerciseList;

//@property (strong, nonatomic) NSArray *exercises;
@property (strong, nonatomic) id<CurrentProgramObserver> programObserver;
@property (strong, nonatomic) ProgramDataSource *programDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
