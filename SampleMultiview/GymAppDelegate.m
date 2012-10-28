//
//  SampleAppDelegate.m
//  SampleMultiview
//
//  Created by James on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GymAppDelegate.h"
#import "ExerciseViewController.h"
#import "ProgramDataSource.h"
#import "ProgramDelegate.h"
#import "NavigationViewController.h"
#import "Event.h"
#import "ExerciseDetailViewController.h"

@implementation GymAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];
    
    //    NavigationViewController *navigationController = (NavigationViewController *) self.window.rootViewController;
    //    ExerciseViewController *viewController = (ExerciseViewController *) [navigationController.childViewControllers objectAtIndex: 0];
    
    ExerciseViewController *viewController = (ExerciseViewController *) self.window.rootViewController;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];
    ExerciseDetailViewController *exerciseDetailViewController = (ExerciseDetailViewController*)[storyboard instantiateViewControllerWithIdentifier: @"exerciseDetailViewController"];
    
    viewController.currentExerciseDetailViewController = exerciseDetailViewController;
    
    viewController.context = [self managedObjectContext];
    
    ProgramDataSource *programDataSource = [[ProgramDataSource alloc] initWithObservers: viewController, exerciseDetailViewController, nil];
    programDataSource.context = [self managedObjectContext];
    exerciseDetailViewController.programDatasource = programDataSource;
    
    ProgramDelegate *programDelegate = [[ProgramDelegate alloc] init];
    
    programDelegate.programDataSource = programDataSource;
    
    viewController.programDatasource = programDataSource;
    viewController.programDelegate = programDelegate;
    
    return YES;
}
/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    //    NSError *error;
    //    if (managedObjectContext != nil) {
    //        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
    //			// Handle the error.
    //        }
    //    }
}

#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
	
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
	
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
	
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"Programs.sqlite"]];
	NSLog(@"Using store %@", storeUrl.absoluteString);
	NSError *error;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        // Handle the error.
        NSLog(@"Unable to created persistent store");
        NSLog(@"%@", error);
    }
	
    return persistentStoreCoordinator;
}

#pragma mark -
#pragma mark Application's documents directory

/**
 Returns the path to the application's documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    // store the program
    // make the app background friendly to continue to timer if any
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
@end

//- (void) loadEvent
//{
//    NSManagedObjectContext *context = [self managedObjectContext];
//	if (!context) {
//		// Handle the error.
//	}
//
//    Event *event = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:context];
//    [event setLatitude:[NSNumber numberWithDouble:123]];
//	[event setLongitude:[NSNumber numberWithDouble:567]];
//	[event setCreationDate:[NSDate date]];
//
//    NSError *error;
//    if (![context save:&error]) {
//        NSLog(@"Failed to save");
//    }
//
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:context];
//	[request setEntity:entity];
//
//	NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
//	if (mutableFetchResults == nil) {
//		// Handle the error.
//        NSLog(@"Failed to retrieve");
//	}
//
//    for (Event *event in mutableFetchResults) {
//        NSLog(@"Event %@", event.latitude.stringValue);
//    }
//}

//- (NSManagedObjectContext *) setupContext
//{
//    NSManagedObjectContext *context = [self managedObjectContext];
//	if (!context) {
//        NSLog(@"Failed to create context");
//	}

//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//	NSEntityDescription *programEntity = [NSEntityDescription entityForName:@"Program" inManagedObjectContext:context];
//	[request setEntity:programEntity];
//
//    NSError *error;
//    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
//	if (mutableFetchResults == nil) {
//		// Handle the error.
//	}
//
//    for (Program *program in mutableFetchResults) {
//        NSLog(@"%@");
//    }
//    return context;
//}

/**
 Performs the save action for the application, which is to send the save:
 message to the application's managed object context.
 */
//- (IBAction)saveAction:(id)sender {
//
//    NSError *error;
//    if (![[self managedObjectContext] save:&error]) {
//		// Handle error
//    }
//}


//- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
//
//    if (persistentStoreCoordinator != nil) {
//        return persistentStoreCoordinator;
//    }
//
//    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"Events.sqlite"]];
//
//	NSError *error;
//    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
//    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
//        // Handle the error.
//        NSLog(@"Unable to created persistent store");
//    }
//
//    return persistentStoreCoordinator;
//}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
//- (NSPersistentStoreCoordinator *)persistentStoreCoordinator2 {
//
//    if (persistentStoreCoordinator != nil) {
//        return persistentStoreCoordinator;
//    }
//
//    //    NSPersistentDocument *d = NSPersistentDocument.[[NSPersistentDocument alloc] init];
//    //
//    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"Programs.sqlite"]];
//
//	NSError *error;
//    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
//
////    if (![persistentStoreCoordinator addPersistentStoreWithType:NSBinaryStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
//    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
//        // Handle the error.
//    }
//
//    return persistentStoreCoordinator;
//}


//{
//    SlidingPanelContainerViewController *slidingPanel =  (SlidingPanelContainerViewController*)self.window.rootViewController;
//
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];
//
//    CurrentUIViewController *currentUIViewController = (CurrentUIViewController*)[storyboard instantiateViewControllerWithIdentifier: @"currentView"];
//    SummaryDetailWithChildViewController *programViewController = (SummaryDetailWithChildViewController*)[storyboard instantiateViewControllerWithIdentifier: @"summaryProgramView"];
//    MainPanelOverlayViewController *mainPanelOverlayViewController = (MainPanelOverlayViewController*)[storyboard instantiateViewControllerWithIdentifier: @"mainPanelOverlayView"];
//
////    ProgramDataSource *programDataSource = [[ProgramDataSource alloc]initWithObservers:programViewController, currentUIViewController, nil];
//
////    programViewController.programDataSource = programDataSource;
////    currentUIViewController.programDataSource = programDataSource;
//
//    slidingPanel.mainViewController = currentUIViewController;
//    slidingPanel.summarySlidingViewController = programViewController;
//    slidingPanel.mainPanelOverlayViewController = mainPanelOverlayViewController;
//
//    programViewController.currentSummaryObserver = mainPanelOverlayViewController;
//    return YES;
//}

//    SlidingPanelContainerViewController *slidingPanel =  (SlidingPanelContainerViewController*)[storyboard instantiateViewControllerWithIdentifier: @"slidingPanelView"];

//    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
//    SlidingPanelContainerViewController *slidingPanel =  (SlidingPanelContainerViewController*)[navigationController topViewController];

//    FullProgramViewController *fullProgramViewController = (FullProgramViewController*)[storyboard instantiateViewControllerWithIdentifier: @"fullProgramView"];
//
//    slidingPanel.expandedSlidingViewController = fullProgramViewController;

//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];

//    SlidingPanelContainerViewController *slidingPanelContainerViewController = (SlidingPanelContainerViewController*)[storyboard instantiateViewControllerWithIdentifier: @"currentViewController"];

//    CurrentUIViewController *currentUIViewController = (CurrentUIViewController*)[storyboard instantiateViewControllerWithIdentifier: @"currentViewController"];
//
//    ProgramViewController *programViewController = (ProgramViewController*)[storyboard instantiateViewControllerWithIdentifier: @"programViewController"];
//
////    SlidingPanelContainerViewController *slidingPanelContainerViewController = [[SlidingPanelContainerViewController alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    slidingPanelContainerViewController = [[SlidingPanelContainerViewController alloc] init];
//    [slidingPanelContainerViewController makeKeyAndVisible];
//

//    CurrentViewController *currentViewController = (CurrentViewController *)self.window.rootViewController;

//ProgramViewController *exerciseViewController = (ProgramViewController *)self.window.rootViewController;

//    self.tableDelegate = [[ExerciseTableDelegate alloc] init];
//    self.dataController = [[ExerciseDataController alloc] initWithProgramStatus:exerciseViewController];
//    self.pickerDelegate = [[ExercisePickerDelegate alloc] initWithWithController:exerciseViewController];
//
//    tableDelegate.dataController = dataController;
//    exerciseViewController.tableDelegate = tableDelegate;
//    exerciseViewController.pickerDelegate = pickerDelegate;


//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    ExerciseTableDelegate *tableDelegate = [[ExerciseTableDelegate alloc] initWithTableView:rootViewController.tableView];
//    OptionsViewController *optionsViewController = (OptionsViewController *)[[navigationController viewControllers] objectAtIndex:0];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];
//
//    ExerciseViewController *exerciseViewController = (ExerciseViewController*)[storyboard instantiateViewControllerWithIdentifier: @"exerciseViewController"];


//    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
//    ExerciseViewController *exerciseViewController = (ExerciseViewController *)[[navigationController viewControllers] objectAtIndex:0];



//- (void)applicationWillTerminate:(UIApplication *)application
//{
//    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//}

//- (void)applicationDidFinishLaunching:(UIApplication *)application
//{
//    self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"carbon_fibre.png"]];
//
//    self.exerciseViewController.backgroundColor = self.backgroundColor;
//
////    [window addSubview:tabBarController.view];
////    [window makeKeyAndVisible];
//}

