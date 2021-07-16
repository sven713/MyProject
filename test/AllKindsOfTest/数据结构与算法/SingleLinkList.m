//
//  SingleLinkList.m
//  test
//
//  Created by 宋锡铭 on 2020/5/28.
//  Copyright © 2020 sven. All rights reserved.
//

#import "SingleLinkList.h"
#import "ListNode.h"

@implementation SingleLinkList




- (ListNode*)nodeWithValue:(int)value {
    ListNode *currentNode = self.head;
    while (currentNode != nil && currentNode.value != value) {
        currentNode = currentNode.next;
    }
    
    if(currentNode == nil){
        NSLog(@"元素不在链表中");
        return nil;
    }
    return currentNode;
}

- (ListNode*)nodeAtIndex:(int)index{
    if(index < 0){
        NSLog(@"下标不合法,不能为负");
        return nil;
    }
    
    ListNode *currentNode = self.head;
    int pos = 0;
    while (currentNode != nil && pos != index) {
        currentNode = currentNode.next;
        pos++;
    }
    if (currentNode == nil) {
        NSLog(@"index越界");
    }
    return currentNode;
}



- (void)insertNodeWithValue:(int)value{ //从后面插入?
    ListNode *newNode = [[ListNode alloc] initWithElement:value];
    ListNode *currentNode = self.head;
    while (currentNode.next != nil) {
        currentNode = currentNode.next;
    }
    NSLog(@"心智:%@",newNode);
    currentNode.next = newNode;
    [self display];
}

- (void)insertNode:(nonnull ListNode*)node{
    ListNode *currentNode = self.head;
    while (currentNode.next != nil) {
        currentNode = currentNode.next;
    }
    currentNode.next = node;
}


//--------上面测试通过--------
- (void)frontInsertNode:(ListNode *)node {
    node.next = self.head;
    self.head = node; //打印是从头打印的
}


//+ (void)insertNodeWithValue:(int)value afterNode:(nonnull ListNode*)node{
//    //类如何访问对象?
//
//}
//+ (void)insertNode:(nonnull ListNode*)aNode afterNode:(nonnull ListNode*)node{
//    ListNode *lastNodes = node.next;
//    node.next = aNode;
//    aNode.next = lastNodes;
//}
//OK
- (void)insertNodeWithValue:(int)value beforeNode:(nonnull ListNode*)node{
    
    ListNode *newNode = [[ListNode alloc] initWithElement:value];
    if(node.value == self.head.value){ //在表头插入
        
        newNode.next = self.head;
        self.head = newNode;
        return;
    }
    ListNode *preNode = [self prevNode:node];
    ListNode *lastNodes = preNode.next;
    //prenode不存在,可能真不存在;如果存在那一定可以插入;如果不存在,为啥不存在,要么表头,要么不在链表中
    if (preNode == nil) {
        NSLog(@"查询的node不在链表中");
        return;
    }
    preNode.next = newNode;
    newNode.next = lastNodes;
}

- (void)insertNode:(nonnull ListNode*)aNode beforeNode:(nonnull ListNode*)node{
    ListNode *newNode = aNode;
    if(node.value == self.head.value){ //在表头插入
        
        newNode.next = self.head;
        self.head = newNode;
        return;
    }
    ListNode *preNode = [self prevNode:node];
    ListNode *lastNodes = preNode.next;
    
    if (preNode == nil) {
        NSLog(@"查询的node不在链表中");
        return;
    }
    preNode.next = newNode;
    newNode.next = lastNodes;
}

- (void)deleteNode:(nonnull ListNode*)node{
    ListNode *currentNode = self.head;
    while (currentNode != nil && currentNode.value != node.value) {
        currentNode = currentNode.next;
    }
    if(currentNode == nil){
        NSLog(@"被删除的元素不在");
        return;
    }
    //前一个元素,指向后一个元素
    ListNode *preNode = [self prevNode:currentNode]; //第一个元素删除没成功
    if(preNode == nil){ //这里currentNode存在,前一个不存在,一定是删除首元素
        self.head = currentNode.next;
    }else {
        preNode.next = currentNode.next;
    }
}
- (void)deleteNodesWithValue:(int)value{
    ListNode *currentNode = self.head;
    while (currentNode != nil && currentNode.value != value) {
        currentNode = currentNode.next;
    }
    if(currentNode == nil){
        NSLog(@"被删除的元素不在");
        return;
    }
    //前一个元素,指向后一个元素
    ListNode *preNode = [self prevNode:currentNode]; //第一个元素删除没成功
    if(preNode == nil){ //这里currentNode存在,前一个不存在,一定是删除首元素
        self.head = currentNode.next;
    }else {
        preNode.next = currentNode.next;
    }
}

//--------我的方法-------
- (ListNode *)prevNode:(ListNode *)node { //OK
    ListNode *currentNode = self.head;
    
    while (currentNode.next != nil && currentNode.next.value != node.value) {
        currentNode = currentNode.next;
    }
    if(currentNode.next == nil){
        NSLog(@"该节点不在链表中");
        return nil;
    }
    return currentNode;
}

-(void)display {
    ListNode *currentNode = self.head;
    while (currentNode != nil) {
        NSLog(@"打印所有元素:%d",currentNode.value);
        currentNode = currentNode.next;
    }
}

@end
