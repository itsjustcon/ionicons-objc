
#import "IonIcons.h"

@implementation IonIcons

+ (UIFont *)fontWithSize:(CGFloat)fontSize {
    
    // List all fonts on iPhone
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily) {
        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNames objectAtIndex:indFamily]]];
        for (indFont=0; indFont<[fontNames count]; ++indFont)
            NSLog(@"    Font name: %@", [fontNames objectAtIndex:indFont]);
    }
    
    return [UIFont fontWithName:@"Ionicons" size:fontSize];
}



#pragma mark - UIImage+IonIcons

+ (UIImage *)imageWithIcon:(NSString *)icon color:(UIColor *)color fontSize:(CGFloat)fontSize imageSize:(CGSize)imageSize {
    return [UIImage new];
}



#pragma mark - UILabel+IonIcons

+ (UILabel *)labelWithIcon:(NSString *)icon fontSize:(CGFloat)fontSize color:(UIColor *)color {
    return [UILabel new];
}

+ (UILabel *)autoresizingLabelWithIcon:(NSString *)icon fontSize:(CGFloat)fontSize color:(UIColor *)color {
    return [UILabel new];
}



#pragma mark - UIBarButtonItem+IonIcons

+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon color:(UIColor *)color target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton new];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.showsTouchWhenHighlighted = YES;
    btn.titleLabel.font = [self fontWithSize:32];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitle:icon forState:UIControlStateNormal];
    [btn sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}



@end
