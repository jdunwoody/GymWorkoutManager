//
//  CurrentUIViewController.h
//  GymApp
//
//  Created by James Dunwoody on 27/08/12.
//
//

#import <UIKit/UIKit.h>

#import "LoadProgramObserver.h"

@class Program;

@interface CurrentUIViewController : UIViewController<LoadProgramObserver>

- (void) programLoadedWithProgram:(Program *) withProgram;

@property (weak, nonatomic) IBOutlet UILabel *comment;

@end
