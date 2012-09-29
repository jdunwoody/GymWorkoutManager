//
//  EditWeightController.h
//  GymApp
//
//  Created by James Dunwoody on 24/09/12.
//
//

#import <UIKit/UIKit.h>
#import "ProgramDataSource.h"

@class ExerciseViewController;

@interface EditWeightController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *weightValues;
}

@property(strong, nonatomic) ProgramDataSource *programDataSource;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) ExerciseViewController *exerciseViewController;

@end
