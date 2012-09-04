#import <UIKit/UIKit.h>

@interface SummaryProgramViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *overlayImage;
@property (strong, nonatomic) NSArray *exercises;

@end
