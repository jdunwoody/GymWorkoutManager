//
//  EditRepDelegate.h
//  GymApp
//
//  Created by James Dunwoody on 1/10/12.
//
//

#import <Foundation/Foundation.h>

@class ProgramDataSource;

@interface EditRepDelegate : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *repValues;
}

@property(strong, nonatomic) ProgramDataSource *programDataSource;

@end
