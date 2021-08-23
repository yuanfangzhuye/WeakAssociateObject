//
//  Person+WeakTest.h
//  WeakAssociateObject
//
//  Created by lab team on 2021/8/23.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (WeakTest)

@property (nonatomic, strong) id delegate;

@property (nonatomic, strong) id customWeakObject;

@property (nonatomic, assign) id assignObject;

@end

NS_ASSUME_NONNULL_END
