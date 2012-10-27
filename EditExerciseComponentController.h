//
//  EditExerciseComponentController.h
//  GymApp
//
//  Created by James Dunwoody on 7/10/12.
//
//

#import <Foundation/Foundation.h>

@class Set;
@class ProgramDataSource;
@class ExerciseDetailViewController;

@protocol EditExerciseComponentController <NSObject>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (strong, nonatomic) ExerciseDetailViewController *exerciseViewController;
@property (strong, nonatomic) Set *set;
@property (strong, nonatomic) ProgramDataSource *programDatasource;

@end
