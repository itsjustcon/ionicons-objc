
#import "UIFont+IonIcons.h"

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

@end
