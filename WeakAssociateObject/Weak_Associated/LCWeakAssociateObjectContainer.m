//
//  LCWeakAssociateObjectContainer.m
//  WeakAssociateObject
//
//  Created by lab team on 2021/8/23.
//

#import "LCWeakAssociateObjectContainer.h"

@implementation LCWeakAssociateObjectContainer

- (instancetype)initWithWeakObject:(id)object {
    self = [super init];
    if (self) {
        _weakObject = object;
    }
    
    return self;
}

@end
