//
//  BaseViewController.m
//  BlockKitManager
//
//  Created by GRX on 2023/2/9.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationItem.title = self.navTitle;
    UIBarButtonItem *backBtn = [UIBarButtonItem gk_itemWithImage:[UIImage imageNamed:@"Spark_back"] target:self action:@selector(dismiss)];
    self.gk_navLeftBarButtonItem    = backBtn;
    self.gk_navBackgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)dismiss{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
