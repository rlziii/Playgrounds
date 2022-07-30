#import "MainView.h"
#import "MainViewController.h"

#pragma mark - Interface

@interface MainViewController ()

@property UIView *mainView;

@end

#pragma mark - Implementation

@implementation MainViewController

- (void)loadView {
    self.mainView = [[MainView alloc] initWithFrame:CGRectZero];
    self.view = self.mainView;
}

@end
