//
//  BlocksKitViewController.m
//  BlockKitManager
//
//  Created by GRX on 2023/2/9.
//

#import "BlocksKitViewController.h"
#import "A2DynamicDelegate.h"
#import "NSObject+A2BlockDelegate.h"
@interface BlocksKitViewController ()

@end

@implementation BlocksKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    [self creatButtonView];
    [self creatUITextField];
}

-(void)creatView{
    UIView *vBlock = [UIView new];
    vBlock.backgroundColor = [UIColor orangeColor];
    vBlock.layer.cornerRadius = 5;
    [self.view addSubview:vBlock];
    vBlock.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, 150).widthIs(200).heightIs(80);
    /** 给View添加点击事件 */
    [vBlock bk_whenTapped:^{
        NSLog(@"view点击");
    }];
}

-(void)creatButtonView{
    UIButton *btnBlock = [UIButton new];
    btnBlock.backgroundColor = [UIColor purpleColor];
    btnBlock.layer.cornerRadius = 5;
    [self.view addSubview:btnBlock];
    btnBlock.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, 300).widthIs(200).heightIs(80);
    [btnBlock bk_addEventHandler:^(id sender) {
        NSLog(@"btnBlock点击");
    }forControlEvents:UIControlEventTouchUpInside];
}

-(void)creatUITextField{
    UITextField *textField = [UITextField new];
    textField.layer.borderWidth = 1;
    textField.layer.cornerRadius = 5;
    textField.placeholder = @"textField点击";
    [self.view addSubview:textField];
    textField.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, 450).widthIs(200).heightIs(40);
    textField.bk_shouldBeginEditingBlock = ^(UITextField *textView){
           NSLog(@"shouldBeginEditing");
           return YES;
       };
    textField.bk_shouldEndEditingBlock = ^(UITextField *textView){
           NSLog(@"shouldEndEditing");
           return YES;
       };
    textField.bk_didBeginEditingBlock = ^(UITextField *textView){
           NSLog(@"didBeginEditing");
       };
    textField.bk_didEndEditingBlock = ^(UITextField *textView){
           NSLog(@"didEndEditing");
       };
}

@end
