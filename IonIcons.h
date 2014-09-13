
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IonIcons-codes.h"

typedef enum {
    IonIconPositionLeft,
    IonIconPositionRight
} IonIconPosition;

@interface IonIcons : NSObject

+ (UIFont *)fontWithSize:(CGFloat)fontSize;

// NSAttributedString+IonIcons
+ (NSAttributedString *)attributedStringWithIcon:(NSString *)icon size:(CGFloat)size;
+ (NSAttributedString *)attributedStringWithIcon:(NSString *)icon text:(NSString *)text size:(CGFloat)size;
+ (NSAttributedString *)attributedStringWithIcon:(NSString *)icon iconPosition:(IonIconPosition)iconPosition iconColor:(UIColor *)iconColor iconSize:(CGFloat)iconSize
                                            text:(NSString *)text textAttributes:(NSDictionary *)textAttributes;

// UIImage+IonIcons
+ (UIImage *)imageWithIcon:(NSString *)icon color:(UIColor *)color fontSize:(CGFloat)fontSize;

// UILabel+IonIcons
+ (UILabel *)labelWithIcon:(NSString *)icon fontSize:(CGFloat)fontSize color:(UIColor *)color;
+ (UILabel *)autoresizingLabelWithIcon:(NSString *)icon fontSize:(CGFloat)fontSize color:(UIColor *)color;

// UIButton+IonIcons
+ (UIButton *)buttonWithIcon:(NSString *)icon fontSize:(CGFloat)fontSize color:(UIColor *)color highlightColor:(UIColor *)highlightColor;

// UIBarButtonItem+IonIcons
+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon target:(id)target action:(SEL)action;  // color = white
+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon color:(UIColor *)color target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon title:(NSString *)title target:(id)target action:(SEL)action;

@end
