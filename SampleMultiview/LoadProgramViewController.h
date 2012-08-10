//
//  LoadProgramViewController.h
//  GymApp
//
//  Created by James Dunwoody on 10/08/12.
//
//

#import <UIKit/UIKit.h>
#import "CurrentViewController.h"

@interface LoadProgramViewController : UIViewController

- (IBAction)newProgramChosen:(id)sender;

@property (strong, nonatomic) CurrentViewController *delegate;

@end
