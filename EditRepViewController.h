//
//  EditRepViewController.h
//  GymApp
//
//  Created by James Dunwoody on 27/09/12.
//
//

#import <UIKit/UIKit.h>
#import "ProgramDataSource.h"

@interface EditRepViewController : UIViewController
{
    NSMutableArray *repValues;
}

@property(strong, nonatomic) ProgramDataSource *programDataSource;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@end
