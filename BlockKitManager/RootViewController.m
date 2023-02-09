//
//  RootViewController.m
//  BlockKitManager
//
//  Created by GRX on 2023/2/9.
//

#import "RootViewController.h"
#import "BaseViewController.h"
@interface RootViewController ()
@property(nonatomic,strong)UITableView *rootTableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSMutableArray *vcListArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    self.vcListArray = [NSMutableArray arrayWithCapacity:0];
    self.gk_navigationItem.title = @"BlocksKit基本用法";
    self.gk_navBackgroundColor = [UIColor whiteColor];
    [self creatDataArray];
    [self creatTableView];
}

-(void)creatDataArray{
    NSArray *titleArray = @[@"UIView+BlocksKit",@"NSObject+BlocksKit",@"NSTimer+BlocksKit"];
    NSArray *vcListArray = @[@"BlocksKitViewController",@"BlocksKitObjectController",@"BlocksKitNSTimerController"];
    [self.dataArray addObjectsFromArray:titleArray];
    [self.vcListArray addObjectsFromArray:vcListArray];
}

-(void)creatTableView{
    self.rootTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100) style:UITableViewStylePlain];
    self.rootTableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.rootTableView];
    [self.rootTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    A2DynamicDelegate *datasource = self.rootTableView.bk_dynamicDataSource;
    A2DynamicDelegate *delegate = self.rootTableView.bk_dynamicDelegate;
    [datasource implementMethod:@selector(tableView:numberOfRowsInSection:) withBlock:^ NSInteger (UITableView *tableView,NSInteger section){
        return self.dataArray.count;
    }];
    [datasource implementMethod:@selector(tableView:cellForRowAtIndexPath:) withBlock:^ UITableViewCell * (UITableView *tableView, NSIndexPath *indexPath){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = self.dataArray[indexPath.row];
        return cell;
    }];
    [delegate implementMethod:@selector(tableView:heightForRowAtIndexPath:) withBlock:^ CGFloat (UITableView *tableview , NSIndexPath * indexPath) {
        return 60;
    }];
    [delegate implementMethod:@selector(tableView:didSelectRowAtIndexPath:) withBlock:^(UITableView *tableView, NSIndexPath *indexPath){
        BaseViewController *baseVC = [[NSClassFromString(self.vcListArray[indexPath.row]) alloc] init];
        baseVC.navTitle = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:baseVC animated:YES];
    }];
    self.rootTableView.dataSource = (id)datasource;
    self.rootTableView.delegate = (id)delegate;
}

@end
