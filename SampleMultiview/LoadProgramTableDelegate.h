//
//  LoadProgramTableDelegate.h
//  GymApp
//
//  Created by James Dunwoody on 11/08/12.
//
//

#import <UIKit/UIKit.h>
#import "LoadProgramDataSource.h"

@interface LoadProgramTableDelegate : NSObject<UITableViewDelegate>

- (id) initWithDataSource: (LoadProgramDataSource *)withDataSource;

@property (strong, nonatomic) LoadProgramDataSource *dataSource;

@end
