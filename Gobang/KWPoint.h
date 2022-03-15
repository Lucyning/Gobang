#import <Foundation/Foundation.h>

@interface KWPoint : NSObject

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

- (id)initPointWith:(NSInteger)x y:(NSInteger)y;

@end
