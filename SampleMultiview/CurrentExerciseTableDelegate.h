//
//  CurrentExerciseTableDelegate.h
//  GymApp
//
//  Created by James Dunwoody on 19/08/12.
//
//

#import <Foundation/Foundation.h>
#import "Program.h"

@interface CurrentExerciseTableDelegate : NSObject<UITableViewDataSource, UITableViewDelegate>

- (id) initWithTableView: (UITableView *) withTableView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Program *program;

@end
