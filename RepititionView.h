//
//  JustAnIconView.h
//  GymApp
//
//  Created by James Dunwoody on 21/09/12.
//
//

#import <UIKit/UIKit.h>
#import "PopoverPresentable.h"
#import "Set.h"

@class ExerciseViewController;

@interface RepititionView : UIView<UIGestureRecognizerDelegate>

- (id)initWithFrame:(CGRect)frame withNibName: (NSString *) nibName;

@property (weak, nonatomic) IBOutlet UILabel *rest;
@property (weak, nonatomic) IBOutlet UILabel *reps;
@property (weak, nonatomic) IBOutlet UILabel *weight;

@property (strong, nonatomic) id<PopoverPresentable> delegate;
@property (strong, nonatomic) ExerciseViewController *viewController;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *repTapGesture;
- (IBAction)repTapped:(id)sender;

@property (strong, nonatomic) Set *set;

@end
 