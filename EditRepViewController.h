//
//  EditRepViewController.h
//  GymApp
//
//  Created by James Dunwoody on 27/09/12.
//
//

#import <UIKit/UIKit.h>
#import "ProgramDataSource.h"

@class ExerciseDetailViewController;
@class RepititionView;
@class EditRepDelegate;
@class EditRestDelegate;
@class EditWeightDelegate;

@interface EditRepViewController : UIViewController
{
    EditRepDelegate *editRepDelegate;
    EditRestDelegate *editRestDelegate;
    EditWeightDelegate *editWeightDelegate;
}

@property (weak, nonatomic) IBOutlet UIPickerView *repPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *restPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *weightPickerView;

@property (strong, nonatomic) ExerciseDetailViewController *exerciseViewController;
@property (strong, nonatomic) Set *set;
@property (strong, nonatomic) ProgramDataSource *programDatasource;

@end
