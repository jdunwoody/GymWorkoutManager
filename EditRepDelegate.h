//
//  EditRepDelegate.h
//  GymApp
//
//  Created by James Dunwoody on 1/10/12.
//
//

#import <Foundation/Foundation.h>
#import "Set.h"

@class ProgramDataSource;

@interface EditRepDelegate : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *repValues;
}

@property(strong, nonatomic) ProgramDataSource *programDataSource;
@property(strong, nonatomic) Set *set;

@end
