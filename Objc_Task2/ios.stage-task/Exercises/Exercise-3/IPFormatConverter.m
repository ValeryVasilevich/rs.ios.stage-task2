#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if (!numbersArray || numbersArray.count == 0) {
        return @"";
    }

    NSMutableArray *validNumbers = [NSMutableArray array];

    for (NSInteger i = 0; i < 4; i++) {
        if (i < numbersArray.count) {
            NSInteger value = [numbersArray[i] integerValue];

            if (value < 0) {
                return @"Negative numbers are not valid for input.";
            }

            if (value > 255) {
                return @"The numbers in the input array can be in the range from 0 to 255.";
            }

            [validNumbers addObject:numbersArray[i]];
        } else {
            [validNumbers addObject:@(0)];
        }
    }

    NSString *ipString = [validNumbers componentsJoinedByString:@"."];

    return ipString;
}

@end
