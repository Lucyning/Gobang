#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KWPoint.h"

typedef NS_ENUM(NSInteger, OccupyType) {
    OccupyTypeEmpty = 0,
    OccupyTypeUser,
    OccupyTypeAI ,
    OccupyTypeUnknown,
};

@interface KWPointData : NSObject

@property (nonatomic, strong) KWPoint *p;
@property (nonatomic, assign) int count;

- (id)initWithPoint:(KWPoint *)point count:(int)count;

@end

@interface KWOmni : NSObject

@property (nonatomic, strong) NSMutableArray *curBoard;
@property (nonatomic, assign) OccupyType oppoType;
@property (nonatomic, assign) OccupyType myType;

- (id)initWithArr:(NSMutableArray *)arr opp:(OccupyType)opp my:(OccupyType)my;
- (BOOL)isStepEmergent:(KWPoint *)pp Num:(int)num type:(OccupyType)xType;

@end

@interface KWAI : NSObject

+ (KWPoint *)geablog:(NSMutableArray *)board type:(OccupyType)type;
+ (KWPoint *)SeraphTheGreat:(NSMutableArray *)board type:(OccupyType)type;

@end
