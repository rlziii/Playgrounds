#import "MainViewController.h"
#import "SceneDelegate.h"

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    UIViewController *mainViewController = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    [self.window makeKeyAndVisible];
}

@end
