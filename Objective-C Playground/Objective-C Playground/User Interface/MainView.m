#import "MainView.h"

#pragma mark - Interface

@interface MainView()

@property UILabel *label;

@end

#pragma mark - Implementation

@implementation MainView

UILabel *label;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupSelf];
    }
    
    return self;
}

- (void)setupSelf {
    self.backgroundColor = UIColor.systemBackgroundColor;
    [self setupSubviews];
    [self setupConstraints];
}

- (void)setupSubviews {
    [self setupLabel];
}

- (void)setupLabel {
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    self.label.text = @"Hello, world!";
    [self addSubview:self.label];
}

- (void)setupConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [self.label.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.label.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
    ]];
}

@end
