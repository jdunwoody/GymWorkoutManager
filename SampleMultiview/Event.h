//
//  Event.h
//  GymApp
//
//  Created by James Dunwoody on 15/10/12.
//
//

#import <Foundation/Foundation.h>

@interface Event : NSManagedObject  {
}

@property (nonatomic, retain) NSDate *creationDate;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;

@end
