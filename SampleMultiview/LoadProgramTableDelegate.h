//
//  LoadProgramTableDelegate.h
//  GymApp
//
//  Created by James Dunwoody on 11/08/12.
//
//

#import <UIKit/UIKit.h>
#import "LoadProgramTableDelegate.h"
#import "Program.h"
#import "LoadProgramViewController.h"
#import "LoadProgramObserver.h"
#import "LoadProgramTableDataSource.h"

@interface LoadProgramTableDelegate : NSObject<UITableViewDelegate, UITableViewDataSource>
- (id) initWithDataSource: (LoadProgramTableDataSource *) dataSource withViewObserver: (id<LoadProgramObserver>)observer;

//
//- (id) initWithController: (id<LoadProgramObserver>) withLoadProgramObserver;
//- (NSUInteger) countOfList;
//- (Program *)objectInListAtIndex:(NSUInteger)theIndex;
//
//@property (strong, nonatomic) NSMutableArray *programs;
//@property (strong, nonatomic) id<LoadProgramObserver> loadProgramObserver;

@property (strong, nonatomic) LoadProgramTableDataSource *dataSource;
@property (strong, nonatomic) id<LoadProgramObserver> observer;


@end
