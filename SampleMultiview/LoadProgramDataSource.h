//
//  LoadProgramDataController.h
//  GymApp
//
//  Created by James Dunwoody on 11/08/12.
//
//

#import <UIKit/UIKit.h>
#import "Program.h"

@interface LoadProgramDataSource : NSObject<UITableViewDataSource>

-(NSUInteger) countOfList;

@property (strong, nonatomic) NSMutableArray *programs;

- (Program *)objectInListAtIndex:(NSUInteger)theIndex;

@end
