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

class NodeObj<T> {
    var value: T
    var next: NodeObj?
    init(value: T, next: NodeObj? = nil) {
        self.value = value
        self.next = next
    }
}

// Singly linked list
class LinkedList<T> {
    var head: NodeObj<T>?
    
    init(head: NodeObj<T>? = nil) {
        self.head = head
    }
    
    var size: Int {
        if head == nil {
            return 0
        }
        var currentNode = head
        var count = 0
        while currentNode != nil {
            count = count + 1
            currentNode = currentNode?.next
        }
        return count
    }
    
    func insertAtBegining(newNode: NodeObj<T>?) {
        
        if head != nil {
            let tempHead = head
            head = newNode
            head?.next = tempHead
        }
        else {
            head = newNode
        }
    }
    
    func insertAtEnd(newNode: NodeObj<T>?) {
    
        if head == nil {
            head = newNode
            return
        }
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = newNode
    }
    
    func removeFromFront() {
        if head == nil {
            return
        }
        let tempHead = head?.next
        head = tempHead
    }
    
    func removeFromEnd() {
        if head == nil {
            return
        }
        var current: NodeObj<T>? = head
        var previous: NodeObj<T>?
        
        while current?.next != nil {
            previous = current
            current = current?.next
        }
      
        previous?.next = nil
    }
    
    func remove(at node: NodeObj<T>) {
        if head == nil {
            return
        }

        if head === node {
            var temp = head?.next
            head = temp
            return
        }

        var currentNode = head
        var previousNode: NodeObj<T>?
        
        while currentNode != nil {
            if currentNode === node {
                previousNode?.next = currentNode?.next
                break
            }
            else {
                previousNode = currentNode
                currentNode = currentNode?.next
            }
        }
    }
    
    func getMiddleElement() {
        
    }
    
    func displayAll() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode?.value)
            currentNode = currentNode?.next
        }
    }
    
}

func runLinkedList() {
    
//    runInsertBegining()
//
//    runInsertEnd()
    
    runRemoveAt()
}

func runInsertBegining() {
    let linkedList: LinkedList<Int> = LinkedList<Int>()
    // This follows Lifo pattern
    linkedList.insertAtBegining(newNode: NodeObj(value: 5))
    linkedList.insertAtBegining(newNode: NodeObj(value: 4))
    linkedList.insertAtBegining(newNode: NodeObj(value: 30))

    linkedList.displayAll()

    linkedList.removeFromFront()

    linkedList.displayAll()
}

func runInsertEnd() {
    let linkedList: LinkedList<Int> = LinkedList<Int>()
    // This follows Fifo pattern
    linkedList.insertAtEnd(newNode: NodeObj(value: 5))
    linkedList.insertAtEnd(newNode: NodeObj(value: 4))
    linkedList.insertAtEnd(newNode: NodeObj(value: 30))

    linkedList.displayAll()

    linkedList.removeFromEnd()

    linkedList.displayAll()
}

func runRemoveAt() {
    let linkedList: LinkedList<Int> = LinkedList<Int>()
    let node1 = NodeObj(value: 5)
    let node2 = NodeObj(value: 4)
    let node3 = NodeObj(value: 30)
    let node4 = NodeObj(value: 10)
    linkedList.insertAtEnd(newNode: node1)
    linkedList.insertAtEnd(newNode: node2)
    linkedList.insertAtEnd(newNode: node3)
    linkedList.insertAtEnd(newNode: node4)
    

    linkedList.displayAll()
//    linkedList.remove(at: node1)
//    linkedList.displayAll()
    print("linkedList.size is \(linkedList.size)")
}
