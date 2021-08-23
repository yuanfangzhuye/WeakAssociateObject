//
//  PushViewController.m
//  WeakAssociateObject
//
//  Created by lab team on 2021/8/23.
//

#import "PushViewController.h"
#import "Person+WeakTest.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    Person *p = [[Person alloc] init];
    NSLog(@"p - %@", p);
//    p.delegate = [[NSObject alloc] init];
//    NSLog(@"delegate - %@",p.delegate);
    p.assignObject = [[NSObject alloc] init];
    NSLog(@"assignObject - %@", p.assignObject);
//    p.customWeakObject = [[NSObject alloc] init];
//    NSLog(@"customWeakObject - %@",p.customWeakObject);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
