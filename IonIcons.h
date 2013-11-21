
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IonIcons-codes.h"

@interface IonIcons : NSObject

+ (UIFont *)fontWithSize:(CGFloat)fontSize;

// UIImage+IonIcons
+ (UIImage *)imageWithIcon:(NSString *)icon color:(UIColor *)color fontSize:(CGFloat)fontSize imageSize:(CGSize)imageSize;

// UILabel+IonIcons
+ (UILabel *)labelWithIcon:(NSString *)icon fontSize:(CGFloat)fontSize color:(UIColor *)color;
+ (UILabel *)autoresizingLabelWithIcon:(NSString *)icon fontSize:(CGFloat)fontSize color:(UIColor *)color;

// UIBarButtonItem+IonIcons
+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon color:(UIColor *)color target:(id)target action:(SEL)action;

@end
