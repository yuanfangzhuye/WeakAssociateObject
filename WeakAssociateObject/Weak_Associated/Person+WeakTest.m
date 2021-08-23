//
//  Person+WeakTest.m
//  WeakAssociateObject
//
//  Created by lab team on 2021/8/23.
//

#import "Person+WeakTest.h"
#import <objc/runtime.h>
#import "LCWeakAssociateObjectContainer.h"

NSString const *kWeakObjectKey = @"msdhfhldshflsjdflsdf";
NSString const *kWeakObjec2tKey = @"msdhfhldsh333flsjdflsdf";
NSString const *kWeakObjec3tKey = @"msdhfhld333sh333flsjdflsdf";

@implementation Person (WeakTest)

/**
 关联对象的实现弱引用
 1. 用 OBJC_ASSOCIATION_RETAIN_NONATOMIC 的方式关联一个中间对象，这个对象相当于一个容器，里面弱引用了目标对象
 2. 当需要拿到目标对象时，先取出中间对象（被强引用，一定会存在），再取出其中的弱引用目标对象，如果目标对象已经 dealloc，指针会自动置为 nil，并不会造成野指针的崩溃。
 3. OBJC_ASSOCIATION_ASSIGN 是做不到的
 */
- (void)setDelegate:(id)delegate {
    LCWeakAssociateObjectContainer *container = [[LCWeakAssociateObjectContainer alloc] initWithWeakObject:delegate];
    objc_setAssociatedObject(self, &kWeakObjectKey, container, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)delegate {
    LCWeakAssociateObjectContainer *conatiner = objc_getAssociatedObject(self, &kWeakObjectKey);
    return conatiner.weakObject;
}

/**
 实现 weak，用 __weak 修饰对象，并将其用 block 包裹，关联时，关联 block 对象
 */
- (void)setCustomWeakObject:(id)customWeakObject {
    __weak typeof(customWeakObject) weakObj = customWeakObject;
    typeof (customWeakObject)(^block)(void) = ^() {
        return weakObj;
    };
    objc_setAssociatedObject(self, &kWeakObjec2tKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)customWeakObject {
    id (^block)(void) = objc_getAssociatedObject(self, &kWeakObjec2tKey);
    return block();
}

/**
 使用 OBJC_ASSOCIATION_ASSIGN 关联对象
 */
- (void)setAssignObject:(id)assignObject {
    objc_setAssociatedObject(self, &kWeakObjec3tKey, assignObject, OBJC_ASSOCIATION_ASSIGN);
}

- (id)assignObject {
    return objc_getAssociatedObject(self, &kWeakObjec3tKey);
}

- (void)dealloc
{
//    NSLog(@"%@", self.delegate);
    NSLog(@"%@", self.assignObject);
//    NSLog(@"%@", self.customWeakObject);
}

@end
