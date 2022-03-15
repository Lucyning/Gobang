#import "KWAI.h"

static NSInteger kBoardSize = 19;

//bool operator ==(PointData pointData){ return (count == pointData.count && p == pointData.p);}
//bool operator <(PointData pointData){ return (count < pointData.getCount());}


@implementation KWPointData

- (id)init {
    
    self = [super init];
    if (self) {
        self.p = [[KWPoint alloc] initPointWith:-1 y:-1];
        self.count = 0;
    }
    
    return self;
}

- (id)initWithPoint:(KWPoint *)point count:(int)ncount {
    
    self = [self init];
    if (self) {
//        self.p = point;
        self.p = [[KWPoint alloc] initPointWith:-1 y:-1];
        self.p.x = point.x;
        self.p.y = point.y;
        self.count = ncount;
    }
    
    return self;
}

@end

@implementation KWOmni

- (id)init {
    
    self = [super init];
    if (self) {

        self.oppoType = OccupyTypeEmpty;
        self.myType = OccupyTypeEmpty;
    }
    
    return self;
}

- (id)initWithArr:(NSMutableArray *)arr opp:(OccupyType)opp my:(OccupyType)my {
    
    self = [self init];
    if (self) {
        self.curBoard = arr;
        self.oppoType = opp;
        self.myType = my;
    }
    
    return self;
}

- (BOOL)isStepEmergent:(KWPoint *)pp Num:(int)num type:(OccupyType)xType {
    
//    NSLog(@"is Step emergent");
    
    KWPoint* check = [[KWPoint alloc] initPointWith:pp.x y:pp.y];
    if (![self checkPoint:check]) {
        return FALSE;
    } else {
        
        KWPoint *test = [[KWPoint alloc] initPointWith:check.x y:check.y]; 
        KWPoint *testR = [[KWPoint alloc] initPointWith:check.x y:check.y];
        KWPoint *testL = [[KWPoint alloc] initPointWith:check.x y:check.y];
        
        testR = [[KWPoint alloc] initPointWith:check.x + 1 y:check.y];
        testL = [[KWPoint alloc] initPointWith:check.x - 1 y:check.y];
        
        for(int hi = 1; (test.x+hi < kBoardSize) && ([self.curBoard[(int)testR.x][(int)testR.y] integerValue] == xType); hi++)
            testR = [[KWPoint alloc] initPointWith:testR.x + 1 y:testR.y];
        for(int hii = 1; (test.x-hii >= 0) && ([self.curBoard[(int)testL.x][(int)testL.y] integerValue] == xType); hii++)
            testL = [[KWPoint alloc] initPointWith:testR.x - 1 y:testR.y];
        
        if ([self checkPoint:testL] && [self checkPoint:testR]) {
            if (testR.x - testL.x >= num) {
                if ([self.curBoard[(int)testR.x][(int)testR.y] integerValue] == OccupyTypeEmpty && [self.curBoard[(int)testL.x][(int)testL.y] integerValue] == OccupyTypeEmpty) {
                    return TRUE;
                }
            }
        }
        

        testR = [[KWPoint alloc] initPointWith:check.x y:check.y + 1];
        testL = [[KWPoint alloc] initPointWith:check.x y:check.y - 1];
        
        for(int vi = 1; (test.y+vi < kBoardSize) && ([self.curBoard[(int)testR.x][(int)testR.y] integerValue] == xType); vi++){
            testR.x = testR.x;
            testR.y = testR.y + 1;
        }
        for(int vii = 1; (test.y-vii >= 0) && ([self.curBoard[(int)testL.x][(int)testL.y] integerValue] == xType); vii++){
//            testL = CGPointMake(testL.x, test.y - 1);
            testL.x = testL.x;
            testL.y = testL.y - 1;
        }
        
        if ([self checkPoint:testL]  && [self checkPoint:testR]) {
            if(testR.y - testL.y >= num)
                if([self.curBoard[(int)testR.x][(int)testR.y] integerValue] == OccupyTypeEmpty && [self.curBoard[(int)testL.x][(int)testL.y] integerValue] == OccupyTypeEmpty)
                    return true;
        }
        
        testR.x = check.x + 1;
        testR.y = check.y + 1;
        testL.x = check.x - 1; 
        testL.y = check.y - 1;
        
        for(int ri = 1; (test.x+ri < kBoardSize && test.y+ri < kBoardSize) && ([self.curBoard[(int)testR.x][(int)testR.y] integerValue] == xType); ri++) {
            testR.x = testR.x + 1;
            testR.y = testR.y + 1;
        }
//            testR = CGPointMake(testR.x + 1, testR.y + 1);
        
        for(int rii = 1; (test.x-rii >= 0 && test.y-rii >= 0) && ([self.curBoard[(int)testL.x][(int)testL.y] integerValue] == xType); rii++) {

            testL.x = testL.x - 1;
            testL.y = testL.y - 1;
        }
        
        if ([self checkPoint:testL] && [self checkPoint:testR]) {
            if(testR.x - testL.x >= num)
                if([self.curBoard[(int)testR.x][(int)testR.y] integerValue] == OccupyTypeEmpty && [self.curBoard[(int)testL.x][(int)testL.y] integerValue] == OccupyTypeEmpty)
                    return true;
        }
        

        testR.x = check.x + 1; 
        testR.y = check.y - 1;
        testL.x = check.x - 1;
        testL.y = check.y + 1;
        for(int li = 1; (test.x+li < kBoardSize && test.y-li >= 0) && ([self.curBoard[(int)testR.x][(int)testR.y] integerValue] == xType); li++) {
//            testR = CGPointMake(testR.x + 1, testR.y - 1);
            testR.x = testR.x + 1;
            testR.y = testR.y - 1;
        }
        
//            testR.Set(testR.x+1, testR.y-1);
        for(int lii = 1; (test.x-lii >= 0 && test.y+lii < kBoardSize) && ([self.curBoard[(int)testL.x][(int)testL.y] integerValue] == xType); lii++) {
//            testL = CGPointMake(testL.x - 1, testL.y + 1);
            testL.x = testL.x - 1;
            testL.y = testL.y + 1;
        }
        if ([self checkPoint:testL] && [self checkPoint:testR]) {
            if(testR.x - testL.x >= num)
                if([self.curBoard[(int)testR.x][(int)testR.y] integerValue] == OccupyTypeEmpty && [self.curBoard[(int)testL.x][(int)testL.y] integerValue] == OccupyTypeEmpty)
                    return true;
        }
        
    }
    return FALSE;
}

- (BOOL)checkPoint:(KWPoint *)point {
    
    
    if (((int)point.x >= 0 && (int)point.x < kBoardSize) && ((int)point.y >= 0 && (int)point.y < kBoardSize)) {
        return YES;
    }
    return NO;
}

- (KWPoint *)nextStep:(OccupyType)xType num:(int)num thre:(int)threshold x:(int)startX y:(int)startY {
    
    KWPoint *search = [[KWPoint alloc] initPointWith:startX y:startY];
    KWPoint * hPoint;
    KWPoint * vPoint;
    KWPoint * rPoint;
    KWPoint * lPoint;

    hPoint = [self horizontal:search type:xType num:num thre:threshold];

    vPoint = [self vertical:search type:xType num:num thre:threshold];

    rPoint = [self rightDown:search type:xType num:num thre:threshold];

    lPoint = [self leftDown:search type:xType num:num thre:threshold];
    
    if(num == 5){
        if([self checkPoint:hPoint])
            return hPoint;
        if([self checkPoint:vPoint])
            return vPoint;
        if([self checkPoint:rPoint])
            return rPoint;
        if([self checkPoint:lPoint])
            return lPoint;
    } else{
        
        while([self checkPoint:hPoint] && ![self isStepEmergent:hPoint Num:num type:xType]){
            hPoint = [self horizontal:[self getNextPoint:hPoint] type:xType num:num thre:threshold];
        }
        if([self isStepEmergent:hPoint Num:num type:xType])
            return hPoint;
        
        
        while([self checkPoint:vPoint] && ![self isStepEmergent:vPoint Num:num type:xType]){
            vPoint = [self vertical:[self getNextPoint:vPoint] type:xType num:num thre:threshold];
        }
        if([self isStepEmergent:vPoint Num:num type:xType])
            return vPoint;
        
        while([self checkPoint:rPoint] && ![self isStepEmergent:rPoint Num:num type:xType]){
            rPoint = [self rightDown:[self getNextPoint:rPoint] type:xType num:num thre:threshold];
        }
        if([self isStepEmergent:rPoint Num:num type:xType])
            return rPoint;
    
        while([self checkPoint:lPoint] && ![self isStepEmergent:lPoint Num:num type:xType]){
            lPoint = [self leftDown:[self getNextPoint:lPoint] type:xType num:num thre:threshold];
        }
        if([self isStepEmergent:lPoint Num:num type:xType])
            return lPoint;
    }
    
    KWPoint * invalid = [[KWPoint alloc] init];
    return invalid;
}

- (KWPoint *)horizontal:(KWPoint *)pp type:(OccupyType)xType num:(int)num thre:(int)threshold {
    
    if (![self checkPoint:pp]) {
        return pp;
    }
    
    int count = 0;
    KWPoint *solution = [[KWPoint alloc] init];
    for(int ii = 0; ii < num; ii++){
        
        NSInteger x = (int)(pp.x) + ii;
        NSInteger y = (int)pp.y;
        
        if (x < kBoardSize) {
            if([self.curBoard[x][(int)pp.y] integerValue] == xType){
                count ++;
            }
            
            if([self.curBoard[x][(int)pp.y] integerValue] == OccupyTypeEmpty) {
                solution.x = x;
                solution.y = pp.y;
            }
        }
        
    }
    if(count >= threshold && [self checkPoint:solution])
        return solution;
    
    return [self horizontal:[self getNextPoint:pp] type:xType num:num thre:threshold];
}

- (KWPoint *)vertical:(KWPoint *)pp type:(OccupyType)xType num:(int)num thre:(int)threshold {
    
    if (![self checkPoint:pp]) {
        return pp;
    }
    
//    NSLog(@"in vertical pp.x is %@, pp.y is %@", @(pp.x), @(pp.y));
    
    int count = 0;
    KWPoint *solution = [[KWPoint alloc] init];
    for(int ii = 0; ii < num; ii++){
        
        NSInteger x = (int)(pp.x);
        NSInteger y = (int)pp.y + ii;
        
        if (y < kBoardSize) {
            if([self.curBoard[x][y] integerValue] == xType){
                count ++;
            }
            
            if([self.curBoard[x][y] integerValue] == OccupyTypeEmpty) {
                solution.x = pp.x;
                solution.y = pp.y + ii;
            }
        }
        
    }
    if(count >= threshold && [self checkPoint:solution])
        return solution;

    return [self vertical:[self getNextPoint:pp] type:xType num:num thre:threshold];
}

- (KWPoint *)rightDown:(KWPoint *)pp type:(OccupyType)xType num:(int)num thre:(int)threshold {
    
//    if(!pp.Valid())
//        return pp;
    if (![self checkPoint:pp]) {
        return pp;
    }
    
    int count = 0;
    KWPoint *solution = [[KWPoint alloc] init];
    for(int ii = 0; ii < num; ii++){
        NSInteger x = (int)(pp.x + ii);
        NSInteger y = (int)pp.y + ii;
        
        if ((pp.x+ii < kBoardSize) &&
            (pp.y+ii < kBoardSize)) {
            if(([self.curBoard[x][y] integerValue] == xType))
                count ++;
            
            if([self.curBoard[x][y] integerValue] == OccupyTypeEmpty) {
                solution.x = pp.x+ ii;
                solution.y = pp.y + ii;
            }
        }
       
    }
    if(count >= threshold && [self checkPoint:solution])
        return solution;
    
//    return rightDown(getNextPoint(pp), xType, num, threshold);
    return [self rightDown:[self getNextPoint:pp] type:xType num:num thre:threshold];
}

- (KWPoint *)leftDown:(KWPoint *)pp type:(OccupyType)xType num:(int)num thre:(int)threshold {
    
    if(![self checkPoint:pp])
        return pp;
    
    int count = 0;
    KWPoint *solution = [[KWPoint alloc] init];
    for(int ii = 0; ii < num; ii++){
        
        NSInteger x = (int)(pp.x - ii);
        NSInteger y = (int)pp.y + ii;
        
        if ((pp.x-ii >= 0) &&
            (pp.y+ii < kBoardSize)) {
            if(([self.curBoard[x][y] integerValue] == xType))
                count ++;
//                solution = CGPointMake(pp.x - ii, pp.y + ii);
            
            if([self.curBoard[x][y] integerValue] == OccupyTypeEmpty) {
                solution.x = pp.x - ii;
                solution.y = pp.y + ii;
            }
        }
        
        
//            solution.Set(pp.x-ii, pp.y+ii);
    }
    if(count >= threshold && [self checkPoint:solution])
        return solution;
    
//    return leftDown(getNextPoint(pp), xType, num, threshold);
    return [self leftDown:[self getNextPoint:pp] type:xType num:num thre:threshold];
}

- (KWPoint *)getNextPoint:(KWPoint *)pp {
    
    KWPoint *result = [[KWPoint alloc] init];
    result.x = pp.x;
    result.y = pp.y;
    if(pp.x+1 < kBoardSize){
        result.x = pp.x + 1;
        result.y = pp.y;
        return result;
    }
    result.x = 0;
    result.y = pp.y + 1;
    return result;
}

@end

@implementation KWAI


+ (KWPoint *)geablog:(NSMutableArray *)board type:(OccupyType)type {
    
    KWPoint *calibur = [[self class] SeraphTheGreat:board type:type];
    return calibur;
}

+ (KWPoint *)SeraphTheGreat:(NSMutableArray *)board type:(OccupyType)myType {
    
    KWOmni *omniknight = [[KWOmni alloc] init];
    if(myType == OccupyTypeUser)

        omniknight = [[KWOmni alloc] initWithArr:board opp:OccupyTypeAI my:OccupyTypeUser];
    else

        omniknight = [[KWOmni alloc] initWithArr:board opp:OccupyTypeUser my:OccupyTypeAI];
    KWPoint *calibur;
    
    calibur = [omniknight nextStep:omniknight.myType num:5 thre:4 x:0 y:0];
    if([omniknight checkPoint:calibur]) {
        return calibur;
    }
    
    
    calibur = [omniknight nextStep:omniknight.oppoType num:5 thre:4 x:0 y:0];
    if ([omniknight checkPoint:calibur]) {
        return calibur;
    }
    
    calibur = [omniknight nextStep:omniknight.myType num:4 thre:3 x:0 y:0];
    if([omniknight checkPoint:calibur])

        return calibur;
    
    calibur = [omniknight nextStep:omniknight.oppoType num:4 thre:3 x:0 y:0];
    if ([omniknight checkPoint:calibur]) {
        return calibur;
    }
    
    calibur = [omniknight nextStep:omniknight.myType num:3 thre:2 x:0 y:0];
    if([omniknight checkPoint:calibur])
        return calibur;
    
    calibur = [omniknight nextStep:omniknight.myType num:2 thre:1 x:0 y:0];
    if([omniknight checkPoint:calibur])
        return calibur;
    
    calibur = [omniknight nextStep:omniknight.oppoType num:3 thre:2 x:0 y:0];
    if ([omniknight checkPoint:calibur]) {
        return calibur;
    }
    
    calibur = [omniknight nextStep:omniknight.oppoType num:2 thre:1 x:0 y:0];
    if ([omniknight checkPoint:calibur]) {
        return calibur;
    }
    

    KWPoint *sad = [[KWPoint alloc] initPointWith:(kBoardSize+1)/2 y:(kBoardSize+1)/2];
    return sad;
}

@end
