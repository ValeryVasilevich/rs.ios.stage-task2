#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger count = 0;
    NSInteger diff = [number integerValue];

    for (NSInteger i = 0; i < array.count; i++) {
        NSNumber *currentNumber = array[i];

        for (NSInteger j = i + 1; j < array.count; j++) {
            NSNumber *nextNumber = array[j];

            if (labs([currentNumber integerValue] - [nextNumber integerValue]) == diff) {
                count++;
            }
        }
    }
    return count;
}

@end
