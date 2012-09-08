//
//  CurrentUIViewController.h
//  GymApp
//
//  Created by James Dunwoody on 27/08/12.
//
//

#import <UIKit/UIKit.h>

#import "LoadProgramObserver.h"
#import "CurrentProgramObserver.h"

@class Program;

@interface CurrentUIViewController : UIViewController<LoadProgramObserver, CurrentProgramObserver>

- (void) programLoadedWithProgram:(Program *) withProgram;

@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (strong, nonatomic) Program *program;
@property (weak, nonatomic) IBOutlet UILabel *programNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *exerciseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *exerciseWeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *exerciseRestLabel;
- (IBAction)somethingButtonPressed:(id)sender;

@end
