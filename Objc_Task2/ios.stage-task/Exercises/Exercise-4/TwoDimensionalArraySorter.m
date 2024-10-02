#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (![array.firstObject isKindOfClass:[NSArray class]]) {
        return @[];
    }

    NSMutableArray *numbers = [NSMutableArray array];
    NSMutableArray *strings = [NSMutableArray array];

    for (NSArray *subarray in array) {
        for (id element in subarray) {
            if ([element isKindOfClass:[NSNumber class]]) {
                [numbers addObject:element];
            } else if ([element isKindOfClass:[NSString class]]) {
                [strings addObject:element];
            }
        }
    }

    if (numbers.count > 0 && strings.count == 0) {
        [numbers sortUsingSelector:@selector(compare:)];
        return numbers;
    } else if (strings.count > 0 && numbers.count == 0) {
        [strings sortUsingSelector:@selector(compare:)];
        return strings;
    } else if (numbers.count > 0 && strings.count > 0) {
        [numbers sortUsingSelector:@selector(compare:)];
        [strings sortUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
            return [str2 compare:str1];
        }];
        return @[numbers, strings];
    }

    return @[];
}

@end
