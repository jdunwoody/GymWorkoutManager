//
//  EditWeightDelegate.h
//  GymApp
//
//  Created by James Dunwoody on 2/10/12.
//
//

#import <Foundation/Foundation.h>

@class Set;
@class ProgramDataSource;


@interface EditWeightDelegate : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *weightValues;
}

@property(strong, nonatomic) ProgramDataSource *programDataSource;
@property(strong, nonatomic) Set *set;

- (int) indexOfSet: (Set *) set;
@end
