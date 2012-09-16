//
//  CurrentUIViewController.h
//  GymApp
//
//  Created by James Dunwoody on 27/08/12.
//
//

#import <UIKit/UIKit.h>

#import "LoadProgramInternalObserver.h"
#import "CurrentProgramObserver.h"
#import "ProgramLoadObserver.h"

@class ProgramDataSource;
@class Program;

@interface CurrentUIViewController : UIViewController<LoadProgramInternalObserver, CurrentProgramObserver, UITextFieldDelegate, ProgramLoadObserver>
//, UIPopoverControllerDelegate>
{
    BOOL keyboardShown;
    BOOL viewMoved;
    UITextField *activeField;

}

- (void) programLoadedWithProgram:(Program *) withProgram;

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *programNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *exerciseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *exerciseWeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *exerciseRestLabel;
@property (strong, nonatomic) ProgramDataSource *programDataSource;


- (IBAction)somethingButtonPressed:(id)sender;

@end
