//
//  LinkListTest.m
//  testTests
//
//  Created by 宋锡铭 on 2020/5/28.
//  Copyright © 2020 sven. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListNode.h"
#import "SingleLinkList.h"

@interface LinkListTest : XCTestCase

@end

@implementation LinkListTest
{
    SingleLinkList* _list;
}
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [super setUp];
    ListNode *node1 = [[ListNode alloc] initWithElement:1];
    ListNode *node2 = [[ListNode alloc] initWithElement:2];
    ListNode *node3 = [[ListNode alloc] initWithElement:3];
    ListNode *node4 = [[ListNode alloc] initWithElement:4];
    ListNode *node5 = [[ListNode alloc] initWithElement:5];
    ListNode *node6 = [[ListNode alloc] initWithElement:6];
    node1.next = node2;
    node2.next = node3;
    node3.next = node4;
    node4.next = node5;
    node5.next = node6;
    
    _list = [[SingleLinkList alloc] init]; //忘记初始化了
    _list.head = node1;
//    [_list display];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"链表测试");
    [_list display];
    ListNode *node = [_list nodeWithValue:10];
    NSLog(@"根据值查找node:%@",node);
}


- (void)testNodeAtIndex { //测试方法必须以test开头
    ListNode *node = [_list nodeAtIndex:-5];
    NSLog(@"根据下标查找node:%@",node);
}

- (void)testinsertNodeWithValue {
    NSLog(@"插入测试");
    [_list insertNodeWithValue:88];
    [_list display];
}

- (void)testInsertNode {
    NSLog(@"插入节点测试");
    ListNode *newNode = [[ListNode alloc] initWithElement:888];
    [_list insertNode:newNode];
    [_list display];
}

- (void)testPrevNode {
    NSLog(@"获取前一个节点");
    ListNode *findNode = [[ListNode alloc] initWithElement:9];
    ListNode *preNode = [_list prevNode:findNode];
    NSLog(@"前一个是:%@",preNode);
}


- (void)testInsertNodeWithValue{
    NSLog(@"从某节点前插入");
    ListNode *beforeNode = [[ListNode alloc] initWithElement:888];
    [_list insertNodeWithValue:999 beforeNode:beforeNode];
    [_list display];
}


- (void)testInsertNodeBeforeNode{
    NSLog(@"从某节点前插入节点");
    ListNode *beforeNode = [[ListNode alloc] initWithElement:22222];
    ListNode *newNode = [[ListNode alloc] initWithElement:777];
    [_list insertNode:newNode beforeNode:beforeNode];
    [_list display];
}

- (void)testDeleteNode {
    NSLog(@"删除测试");
    ListNode *toDeleteNode = [[ListNode alloc] initWithElement:2];
    [_list deleteNode:toDeleteNode];
    [_list display];
}

- (void)testdeleteNodesWithValue {
    NSLog(@"元素删除测试");
    [_list deleteNodesWithValue:9];
    [_list display];
}

- (void)testfrontInsertNode {
    NSLog(@"前排插入");
    ListNode *node = [[ListNode alloc] initWithElement:999];
    [_list frontInsertNode:node];
    [_list display];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
