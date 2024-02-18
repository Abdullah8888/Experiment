//
//  LinkedList.swift
//  Experiment
//
//  Created by Abdullah on 05/06/2022.
//

import Foundation

/**
 Linked list Data Structure

 A linked list is a linear data structure that includes a series of connected nodes. Here, each node stores the data and the address of the next node. For example,
 
 Linked lists can be of multiple types: singly, doubly, and circular linked list. In this article, we will focus on the singly linked list.
 
 Note: You might have played the game Treasure Hunt, where each clue includes the information about the next clue. That is how the linked list operates.
 
 Representation of Linked List
 Let's see how each node of the linked list is represented. Each node consists:

 A data item
 An address of another node
 
 
 Linked List Complexity
 Time Complexity

        Worst case    Average Case
 Search             O(n)                            O(n)
 Insert                O(1)                           O(1)
 Deletion           O(1)                            O(1)
 
 Space Complexity: O(n)
 
 Linked List Applications
 Dynamic memory allocation
 Implemented in stack and queue
 In undo functionality of softwares
 Hash tables, Graphs
 */


struct MySinglyLinkedList<T> {
    var head: MyNode<T>?
    var tail: MyNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    var first: Bool {
        return head == nil
    }
    var last: Bool {
        return tail == nil
    }
    
    init () {
        
    }
    
    mutating func displayNodes() {
        //var next  = head?.next
        var index = 0
        while head != nil {
            print("\(head?.data) at \(index)")
            head = head?.next
            index = index + 1
        }
    }
    
    mutating func isLinkedListEven() {
        while head != nil && head?.next != nil {
            head = head?.next?.next
        }
    }
    
    mutating func push(node: MyNode<T>) {
        head = MyNode<T>(data: node.data, next: head)
        //head = newNode
        if tail == nil {
            tail = head
        }
    }
    
    mutating func pushh(node: MyNode<T>?) {
        //head = node
        head?.next = node
        head = head?.next
        //head?.next =
        //head = head?.next
//        if tail == nil {
//            tail = head
//        }
    }
    
    mutating func push(data: T) {
        head = MyNode<T>(data: data, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(data: T) {
        if isEmpty {
            push(data: data)
            return
        }
        tail?.next = MyNode<T>(data: data)
        tail = tail?.next
    }
    
    func pop() {
        head?.next = nil
    }
}

class MyNode<T> {
    var data: T
    var next: MyNode<T>?
    
    init(data: T, next: MyNode<T>? = nil) {
        self.data = data
        self.next = next
    }
    
    init(data: T) {
        self.data = data
    }
}

func sampleSinglLinkedListUsage() {
    
    let node1 = MyNode<String>(data: "Bolu")
    let node2 = MyNode<String>(data: "Tola")
    let node3 = MyNode<String>(data: "John")
    
    let node11 = MyNode<String>(data: "Bolu", next: nil)
    let node22 = MyNode<String>(data: "Tola", next: nil)
    let node33 = MyNode<String>(data: "John", next: nil)
    
//    node1.next = node2
//    node2.next = node3
//    node3.next = nil
    
    //var linkedList = MySinglyLinkedList(head: node1)
    
    var linkedList = MySinglyLinkedList<String>()
    
    //linkedList.push(node: node1)
    linkedList.pushh(node: node11)
    linkedList.pushh(node: node22)
    linkedList.pushh(node: node33)
//    //linkedList.push(node: nil)
//    linkedList.displayNodes()
    
//    linkedList.append(data: "Bok1")
//    linkedList.append(data: "Bok2")
//    linkedList.append(data: "Bok3")
    
    linkedList.displayNodes()
    
}

/**
 Check whether the length of given linked list is Even or Odd

 Difficulty Level : Basic
 Last Updated : 13 May, 2021
 Given a linked list, the task is to make a function which checks whether the length of the linked list is even or odd.
 Examples
 Input : 1->2->3->4->NULL
 Output : Even

 Input : 1->2->3->4->5->NULL
 Output : Odd
 
 Method 1: Count the codes linearly
 Traverse the entire Linked List and keep counting the number of nodes. As soon as the loop is finished, we can check if the count is even or odd. You may try it yourself.
 Method 2: Stepping 2 nodes at a time
 Approach:
 
 */

func isLinkedListEven() {
    let node1 = MyNode<Int>(data: 1)
    let node2 = MyNode<Int>(data: 2)
    //let node3 = MyNode<Int>(data: 3)
    
    node1.next = node2
    //node2.next = node3
    node2.next = nil
    
//    var linkedList = MySinglyLinkedList(head: node1)
//    linkedList.displayNodes()
    
    var head: MyNode<Int>? = node1
    
    while head != nil && head?.next != nil {
        head = head?.next?.next
    }
    
    
    
    if head != nil {
        print("isOdd")
    }
    else {
        print("isEven")
    }
    
    
}
