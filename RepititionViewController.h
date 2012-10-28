//
//  RepititionViewController.h
//  GymApp
//
//  Created by James Dunwoody on 25/09/12.
//
//

#import <UIKit/UIKit.h>
#import "PopoverPresentable.h"

@interface RepititionViewController : UIViewController<UIGestureRecognizerDelegate, PopoverPresentable>

@property (weak, nonatomic) IBOutlet UILabel *reps;
@property (weak, nonatomic) IBOutlet UILabel *rest;

- (IBAction)repTapped:(id)sender;
- (IBAction)restTapped:(id)sender;


@end
