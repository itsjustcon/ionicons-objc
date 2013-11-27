
#import "IonIcons.h"

@implementation IonIcons

+ (UIFont *)fontWithSize:(CGFloat)fontSize {
    /*
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
    */
    return [UIFont fontWithName:@"Ionicons" size:fontSize];
}



#pragma mark - NSAttributedString

+ (NSAttributedString *)attributedStringWithIcon:(NSString *)icon size:(CGFloat)size {
    return [[NSAttributedString alloc] initWithString:icon attributes:@{ NSFontAttributeName:[self fontWithSize:size] }];
}

+ (NSAttributedString *)attributedStringWithIcon:(NSString *)icon text:(NSString *)text size:(CGFloat)size {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@", icon, text]
                                                                                         attributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:size] }];
    [attributedString addAttribute:NSFontAttributeName value:[self fontWithSize:size] range:NSMakeRange(0, 1)];
    return attributedString;
}

+ (NSAttributedString *)attributedStringWithIcon:(NSString *)icon iconPosition:(IonIconPosition)iconPosition iconColor:(UIColor *)iconColor iconSize:(CGFloat)iconSize
                                            text:(NSString *)text textAttributes:(NSDictionary *)textAttributes
{
    NSString *string;
    if (iconPosition == IonIconPositionLeft)        string = [NSString stringWithFormat:@"%@ %@", icon, text];
    else if (iconPosition == IonIconPositionRight)  string = [NSString stringWithFormat:@"%@ %@", text, icon];
    else return nil;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:textAttributes];
    
    NSRange iconRange = NSMakeRange(0, 1);
    if (iconPosition == IonIconPositionRight) iconRange.location = attributedString.length - 1;
    [attributedString addAttributes:@{ NSForegroundColorAttributeName:iconColor, NSFontAttributeName:[self fontWithSize:iconSize] } range:iconRange];
    
    return attributedString;
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



#pragma mark - UIButton+IonIcons

+ (UIButton *)buttonWithIcon:(NSString *)icon fontSize:(CGFloat)fontSize color:(UIColor *)color {
    return [self buttonWithIcon:icon fontSize:fontSize color:color highlightColor:nil];
}

+ (UIButton *)buttonWithIcon:(NSString *)icon fontSize:(CGFloat)fontSize color:(UIColor *)color highlightColor:(UIColor *)highlightColor {
    UIButton *btn = [UIButton new];
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btn.titleLabel.font = [self fontWithSize:fontSize];
    [btn setTitle:icon forState:UIControlStateNormal];
    if (color)          [btn setTitleColor:color forState:UIControlStateNormal];
    if (highlightColor) [btn setTitleColor:highlightColor forState:UIControlStateHighlighted];
    return btn;
}



#pragma mark - UIBarButtonItem+IonIcons

+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon target:(id)target action:(SEL)action {
    return [self barButtonItemWithIcon:icon color:[UIColor whiteColor] target:target action:action];
}

+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon color:(UIColor *)color target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton new];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btn.showsTouchWhenHighlighted = YES;
    btn.titleLabel.font = [self fontWithSize:28];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitle:icon forState:UIControlStateNormal];
    [btn sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon title:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton new];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btn.showsTouchWhenHighlighted = YES;
    
    NSAttributedString *string = [self attributedStringWithIcon:icon text:title size:18];
    [btn setAttributedTitle:string forState:UIControlStateNormal];
    
    [btn sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}



@end
