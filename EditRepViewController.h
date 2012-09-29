//
//  EditRepViewController.h
//  GymApp
//
//  Created by James Dunwoody on 27/09/12.
//
//

#import <UIKit/UIKit.h>
#import "ProgramDataSource.h"

@class ExerciseViewController;
@class RepititionView;

@interface EditRepViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *repValues;
}

@property(strong, nonatomic) ProgramDataSource *programDataSource;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (strong, nonatomic) ExerciseViewController *exerciseViewController;
@property (strong, nonatomic) RepititionView *repititionView;

@end
