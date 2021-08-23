//
//  LCWeakAssociateObjectContainer.h
//  WeakAssociateObject
//
//  Created by lab team on 2021/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCWeakAssociateObjectContainer : NSObject

/**
 定义一个 weak 修饰的目标对象，以及初始化方法
 */

@property (nonatomic, weak) id weakObject;

- (instancetype)initWithWeakObject:(id)object;

@end

NS_ASSUME_NONNULL_END
