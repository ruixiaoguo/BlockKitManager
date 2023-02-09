//
//  BlocksKitButtonController.m
//  BlockKitManager
//
//  Created by GRX on 2023/2/9.
//

#import "BlocksKitObjectController.h"

@interface BlocksKitObjectController ()

@end

@implementation BlocksKitObjectController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatDict];
    [self creatArray];
}

-(void)creatDict{
    NSDictionary *dict = @{@"name":@"xiaohong",
                           @"age":@"18",
                           @"sex":@"女"};
    /** 按条件筛选打印 */
    NSDictionary *dictEnd1 = [dict bk_select:^BOOL(id key, id obj) {
        if ([key isEqualToString:@"name"] || [key isEqualToString:@"age"]) {
            return YES;
        }else{
            return NO;
        }
            
    }];
    NSLog(@"dictEnd1 = %@",dictEnd1);
    /** 按条件筛选打印不符合条件的 */
    NSDictionary *dictEnd2 = [dict bk_reject:^BOOL(id key, id obj) {
        if ([key isEqualToString:@"name"] || [key isEqualToString:@"age"]) {
              return YES;
        }else{
              return NO;
        }
    }];
    NSLog(@"dictEnd2 = %@",dictEnd2);
    /** 遍历修改字典值 */
    NSDictionary *dictEnd3 = [dict bk_map:^id(id key, id obj) {
          return [NSString stringWithFormat:@"%@-修改",obj];
    }];
    NSLog(@"dictEnd3 = %@",dictEnd3);
}

-(void)creatArray{
    NSArray *list = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    /** 遍历数组值 */
    [list bk_each:^(id obj) {
        NSLog(@"bk_each: %@", obj);
    }];
    /** 遍历修改数组值 */
    NSArray *bk_map = [list bk_map:^id(id obj) {
        return [NSString stringWithFormat:@"%@.png", obj];
    }];
    NSLog(@"%@", bk_map);
    /** 数组头部插入值 */
    NSString *bk_reduceStr = [list bk_reduce:@"A" withBlock:^id(id sum, id obj) {
        return [sum stringByAppendingString:obj];
    }];
    NSLog(@"bk_reduceStr: %@", bk_reduceStr);
    /** 查询是否有符合block条件的对象 */
    NSLog(@"bk_any: %d", [list bk_any:^BOOL(id obj) {
        return [obj isEqualToString:@"7"];
    }]);
    /** 查询是否无符合block条件的对象 */
    NSLog(@"bk_none: %d", [list bk_none:^BOOL(id obj) {
        return [obj isEqualToString:@"4"];
    }]);
    /** 查询是否所有元素都符合block条件 */
    NSLog(@"bk_all: %d", [list bk_all:^BOOL(id obj) {
        return [obj isEqualToString:@"4"];
    }]);
    /** 对比两数组元素是否相同 */
    NSArray *arr1 = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    NSArray *arr2 = @[@"1", @"2", @"3", @"4", @"5", @"6", @"4"];
    NSLog(@"%d", [list bk_corresponds:arr1 withBlock:^BOOL(id obj1, id obj2) {
        return [obj1 isEqual:obj2];
    }]);
    NSLog(@"%d", [list bk_corresponds:arr2 withBlock:^BOOL(id obj1, id obj2) {
        return [obj1 isEqual:obj2];
    }]);
    /** 返回所有符合block条件的对象 */
    NSArray *selArr = [list bk_select:^BOOL(id obj) {
        return [obj isEqualToString:@"3"];
    }];
    NSLog(@"bk_select: %@", selArr);
    /** 返回第一个符合block条件的对象 */
    NSString *bk_match = [list bk_match:^BOOL(id obj) {
        return [obj isEqualToString:@"3"];
    }];
    NSLog(@"bk_match: %@", bk_match);
    /** 返回所有不符合block条件的对象 */
    NSArray *bk_reject = [list bk_reject:^BOOL(id obj) {
        return [obj isEqualToString:@"3"];
    }];
    NSLog(@"bk_reject: %@", bk_reject);

}

@end
