#import "AppDelegate.h"
#import "TableCellButtonExampleViewController.h"
#import <Button/Button.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /// This is not required if you manage your own permission requesting.
    [BTNLocationManager allowButtonToRequestLocationPermission:YES];
    
    [[Button sharedButton] configureWithApplicationId:@"app-0000000000000000" completion:^(NSError *error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
    
    // Apply some style to your Button.
    [self applyButtonAppearance];
    
    return YES;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    [[Button sharedButton] handleURL:url];
    
    return YES;
}


- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {

    [[Button sharedButton] handleLocalNotification:notification];
}


#pragma mark - Button Appearance Proxy Styling

- (void)applyButtonAppearance {
    
    BTNDropinButton *appearance = [BTNDropinButton appearance];
    appearance.highlightedTextColor = [UIColor lightGrayColor];
    appearance.iconSize     = 20.0;
    appearance.borderColor  = [UIColor grayColor];
    appearance.borderWidth  = 1.0;
    appearance.cornerRadius = 5.0;
    
    appearance = [BTNDropinButton appearanceWhenContainedIn:
                  [TableCellButtonExampleViewController class], nil];
    appearance.borderWidth = 0.0;
}

@end
