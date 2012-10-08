//
//  EditWeightUIPickerViewController.h
//  GymApp
//
//  Created by James Dunwoody on 6/10/12.
//
//

#import <UIKit/UIKit.h>
#import "ProgramDataSource.h"
#import "EditExerciseComponentController.h"

@class ExerciseViewController;
@class RepititionView;
@class EditWeightDelegate;

@interface EditWeightUIPickerViewController : UIViewController <EditExerciseComponentController>
{
    EditWeightDelegate *editWeightDelegate;
}

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (strong, nonatomic) ExerciseViewController *exerciseViewController;
@property (strong, nonatomic) Set *set;
@property (strong, nonatomic) ProgramDataSource *programDatasource;

@end
