#import <UIKit/UIKit.h>
#import "CurrentProgramObserver.h"

@class Program;

@interface SummaryProgramViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *overlayImage;
@property (weak, nonatomic) IBOutlet UIScrollView *exerciseList;

//@property (strong, nonatomic) NSArray *exercises;
@property (strong, nonatomic) Program *program;
@property (strong, nonatomic) id<CurrentProgramObserver> programObserver;
- (IBAction)menuPlusButton:(id)sender;
- (IBAction)bottomButtonPressed:(id)sender;
@end
