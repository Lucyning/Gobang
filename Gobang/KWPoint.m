#import "KWPoint.h"

@implementation KWPoint

- (id)initPointWith:(NSInteger)x y:(NSInteger)y {
    
    self = [self init];
    if (self) {
        self.x = x;
        self.y = y;
    }
    return self;
}

- (id)init {
    
    self = [super init];
    if (self) {
        self.x = -1;
        self.y = -1;
    }
    
    return self;
}

@end
