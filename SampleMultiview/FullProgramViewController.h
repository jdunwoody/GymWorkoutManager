//
//  FullProgramViewController.h
//  GymApp
//
//  Created by James Dunwoody on 1/09/12.
//
//

#import <UIKit/UIKit.h>

@interface FullProgramViewController : UIViewController

//@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *exercise;
@property (weak, nonatomic) IBOutlet UILabel *reps;
@property (weak, nonatomic) IBOutlet UILabel *rest;
@property (weak, nonatomic) IBOutlet UILabel *weight;

@end
