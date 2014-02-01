#import "Random.h"


@interface Random(Private)
+ (void)staticInit;
@end


@implementation Random

+ (void)staticInit
{
	static BOOL initFlag = FALSE;
	if (!initFlag) {
		srand(time(NULL));
		initFlag = TRUE;
	}
}

+ (CGFloat)randFloat
{
	[Random staticInit];
	return rand() / (RAND_MAX * 1.0);
}

+ (NSUInteger)randInt
{
	[Random staticInit];
	return rand();
}

+ (NSUInteger)randIntRange:(NSRange)range
{
	return range.location + (NSUInteger)([self randInt] * (range.length + 1.0) / (RAND_MAX + 1.0));
}

+ (NSString *)randString:(NSUInteger)length withChars:(NSString *)chars
{
	NSRange range = NSMakeRange(0, [chars length]-1);
	NSMutableString *str = [NSMutableString stringWithCapacity:length];
	for (int i=0; i<length; i++) {
		[str appendString:[chars substringWithRange:NSMakeRange([Random randIntRange:range], 1)]];
	}
	return str;
}

+ (NSString *)randAsciiString:(NSUInteger)length
{
	static NSString *ascii = nil;
	if (!ascii) {
		ascii = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	}
	return [Random randString:length withChars:ascii];
}

@end