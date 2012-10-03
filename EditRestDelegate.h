//
//  EditRestDelegate.h
//  GymApp
//
//  Created by James Dunwoody on 2/10/12.
//
//

#import <Foundation/Foundation.h>

@class ProgramDataSource;

@interface EditRestDelegate : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *minuteValues;
    NSMutableArray *secondValues;
}

@property(strong, nonatomic) ProgramDataSource *programDataSource;

@end
