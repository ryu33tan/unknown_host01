#import <Foundation/Foundation.h>


@interface Random : NSObject {

}

+ (CGFloat)randFloat;
+ (NSUInteger)randInt;
+ (NSUInteger)randIntRange:(NSRange)range;
+ (NSString *)randString:(NSUInteger)length withChars:(NSString *)chars;
+ (NSString *)randAsciiString:(NSUInteger)length;

@end