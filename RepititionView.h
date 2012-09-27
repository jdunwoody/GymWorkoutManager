//
//  JustAnIconView.h
//  GymApp
//
//  Created by James Dunwoody on 21/09/12.
//
//

#import <UIKit/UIKit.h>
#import "PopoverPresentable.h"

@interface RepititionView : UIView<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *rest;
@property (weak, nonatomic) IBOutlet UILabel *reps;

@property (strong, nonatomic) id<PopoverPresentable> delegate;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *repTapGesture;
- (IBAction)repTapped:(id)sender;


@end
 