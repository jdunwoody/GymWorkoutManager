//
//  EditRestUIPickerViewController.h
//  GymApp
//
//  Created by James Dunwoody on 7/10/12.
//
//

#import <UIKit/UIKit.h>
#import "EditExerciseComponentController.h"

@class Set;
@class ExerciseDetailViewController;
@class RepititionView;
@class EditRestDelegate;
@class ProgramDataSource;

@interface EditRestUIPickerViewController : UIViewController<EditExerciseComponentController>
{
    EditRestDelegate *editRestDelegate;
}

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (strong, nonatomic) ExerciseDetailViewController *exerciseViewController;
@property (strong, nonatomic) Set *set;
@property (strong, nonatomic) ProgramDataSource *programDatasource;

@end
