//
//  SingleLinkList.h
//  test
//
//  Created by 宋锡铭 on 2020/5/28.
//  Copyright © 2020 sven. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class ListNode;
@interface SingleLinkList : NSObject

@property (nonatomic, strong) ListNode *head;


- (ListNode*)nodeWithValue:(int)value; // 根据值查找节点
- (ListNode*)nodeAtIndex:(int)index; // 根据下标取节点

- (void)insertNodeWithValue:(int)value; // 插入元素
- (void)insertNode:(nonnull ListNode*)node; // 插入节点

//在节点后插入元素
+ (void)insertNodeWithValue:(int)value afterNode:(nonnull ListNode*)node;

//在节点后插入节点
+ (void)insertNode:(nonnull ListNode*)aNode afterNode:(nonnull ListNode*)node;

//在节点前插入元素
- (void)insertNodeWithValue:(int)value beforeNode:(nonnull ListNode*)node;

//在节点前插入节点
- (void)insertNode:(nonnull ListNode*)aNode beforeNode:(nonnull ListNode*)node;

- (void)deleteNode:(nonnull ListNode*)node;//删除节点
- (void)deleteNodesWithValue:(int)value; //删除元素对应的节点

/***我的方法**/
- (ListNode *)prevNode:(ListNode *)node;
-(void)display;


- (void)frontInsertNode:(ListNode *)node;

@end

NS_ASSUME_NONNULL_END
