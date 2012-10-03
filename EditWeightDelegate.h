//
//  EditWeightDelegate.h
//  GymApp
//
//  Created by James Dunwoody on 2/10/12.
//
//

#import <Foundation/Foundation.h>
@class ProgramDataSource;

@interface EditWeightDelegate : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *weightValues;
}

@property(strong, nonatomic) ProgramDataSource *programDataSource;

@end
