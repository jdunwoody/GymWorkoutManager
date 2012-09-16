//
//  MainPanelOverlayViewController.h
//  GymApp
//
//  Created by James Dunwoody on 15/09/12.
//
//

#import <UIKit/UIKit.h>
#import "CurrentSummaryObserver.h"

@interface MainPanelOverlayViewController : UIViewController<CurrentSummaryObserver>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@end
