//
//  EditRepUIPickerViewController.h
//  GymApp
//
//  Created by James Dunwoody on 7/10/12.
//
//

#import <UIKit/UIKit.h>

#import "ProgramDataSource.h"
#import "EditExerciseComponentController.h"

@class ExerciseDetailViewController;
@class RepititionView;
@class EditRepDelegate;

@interface EditRepUIPickerViewController : UIViewController<EditExerciseComponentController>
{
    EditRepDelegate *editRepDelegate;
}

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (strong, nonatomic) ExerciseDetailViewController *exerciseViewController;
@property (strong, nonatomic) Set *set;
@property (strong, nonatomic) ProgramDataSource *programDatasource;

@end