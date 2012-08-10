//
//  LoadProgramObserver.h
//  GymApp
//
//  Created by James Dunwoody on 10/08/12.
//
//

#import <Foundation/Foundation.h>
#import "LoadProgramObserver.h"
#import "Program.h"

@protocol LoadProgramObserver <NSObject>

- (void) programLoadedWithProgram: (Program *)withProgram;

@end
