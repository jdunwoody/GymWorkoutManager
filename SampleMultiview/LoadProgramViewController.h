//
//  LoadProgramViewController.h
//  GymApp
//
//  Created by James Dunwoody on 10/08/12.
//
//

#import <UIKit/UIKit.h>
#import "CurrentViewController.h"
#import "LoadProgramTableDelegate.h"

@interface LoadProgramViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

- (IBAction)newProgramChosen:(id)sender;

@property (strong, nonatomic) CurrentViewController *delegate;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *programs;

@end
