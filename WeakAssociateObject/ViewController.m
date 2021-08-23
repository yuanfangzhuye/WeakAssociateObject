//
//  ViewController.m
//  WeakAssociateObject
//
//  Created by lab team on 2021/8/23.
//

#import "ViewController.h"
#import "PushViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)btnClick:(id)sender {
    PushViewController *vc = [[PushViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
