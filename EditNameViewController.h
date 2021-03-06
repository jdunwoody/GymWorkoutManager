//
//  EditNameViewController.h
//  GymApp
//
//  Created by James Dunwoody on 24/09/12.
//
//

#import <UIKit/UIKit.h>
#import "ProgramDataSource.h"

@class ExerciseDetailViewController;

@interface EditNameViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *nameValues;
}

@property(strong, nonatomic) ProgramDataSource *programDataSource;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) ExerciseDetailViewController *exerciseViewController;

@end
