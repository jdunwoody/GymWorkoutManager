//
//  LoadProgramDataController.m
//  GymApp
//
//  Created by James Dunwoody on 11/08/12.
//
//

#import "LoadProgramDataSource.h"
#import "Program.h"

@implementation LoadProgramDataSource
@synthesize programs;

- (NSUInteger)countOfList {
    return [self.programs count];
}

- (Program *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.programs objectAtIndex:theIndex];
}

@end
