//
//  BlocksKitNSTimerController.m
//  BlockKitManager
//
//  Created by GRX on 2023/2/9.
//

#import "BlocksKitNSTimerController.h"

@interface BlocksKitNSTimerController ()

@end

@implementation BlocksKitNSTimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btnBlock = [UIButton new];
    btnBlock.backgroundColor = [UIColor grayColor];
    [btnBlock setTitle:@"NSTimer" forState:UIControlStateNormal];
    btnBlock.layer.cornerRadius = 5;
    [self.view addSubview:btnBlock];
    btnBlock.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, 300).widthIs(200).heightIs(80);
    [btnBlock bk_addEventHandler:^(id sender) {
        [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
            NSLog(@"123");
        } repeats:YES];
    }forControlEvents:UIControlEventTouchUpInside];
}

@end
