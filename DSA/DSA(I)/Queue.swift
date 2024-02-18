//
//  Queue.swift
//  Experiment
//
//  Created by Abdullah on 05/06/2022.
//

import Foundation

/** Types of Queues
 In this tutorial, you will learn different types of queues with along with illustration.

 A queue is a useful data structure in programming. It is similar to the ticket queue outside a cinema hall, where the first person entering the queue is the first person who gets the ticket.

 There are four different types of queues:

 Simple Queue
 Circular Queue
 Priority Queue
 Double Ended Queue
 
 */



/**
 Simple Queue
 A queue is a useful data structure in programming. It is similar to the ticket queue outside a cinema hall, where the first person entering the queue is the first person who gets the ticket.
 
 Queue follows the First In First Out (FIFO) rule - the item that goes in first is the item that comes out first.
 
 In programming terms, putting items in the queue is called enqueue, and removing items from the queue is called dequeue
 
 Basic Operations of Queue
 A queue is an object (an abstract data structure - ADT) that allows the following operations:

 Enqueue: Add an element to the end of the queue
 Dequeue: Remove an element from the front of the queue
 IsEmpty: Check if the queue is empty
 IsFull: Check if the queue is full
 Peek: Get the value of the front of the queue without removing it
 
 Applications of Queue
 CPU scheduling, Disk Scheduling
 When data is transferred asynchronously between two processes.The queue is used for synchronization. For example: IO Buffers, pipes, file IO, etc
 Handling of interrupts in real-time systems.
 Call Center phone systems use Queues to hold people calling them in order.
 
 Complexity Analysis
 The complexity of enqueue and dequeue operations in a queue using an array is O(1). If you use pop(N) in python code, then the complexity might be O(n) depending on the position of the item to be popped.
 
 Limitations of Queue
 And we can only add indexes 0 and 1 only when the queue is reset (when all the elements have been dequeued).

 After REAR reaches the last index, if we can store extra elements in the empty spaces (0 and 1), we can make use of the empty spaces. This is implemented by a modified queue called the circular queue
 */

struct SimpleQueue<T> {
    var items: [T?] = []
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    var size: Int {
        items.count
    }
    
    var isFull: Bool {
        items.allSatisfy{ $0 != nil }
    }
    
    mutating func enqueue(item: T?) {
        !isFull ? items.append(item) : print("Queue is full")
    }
    
    mutating func dequeue(item: T) -> T? {
        if !isEmpty {
            guard let last = items.popLast() else {return nil}
            return last
        }
        else {
            return nil
        }
    }
}

struct SimpleQueue2<T> {
    var items: [T] = []
    var front: Int = -1
    var rear: Int = -1
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    var size: Int {
        items.count
    }
    
    var isFull: Bool {
        front == 0 && rear == size - 1 ? true : false
    }
    
    mutating func enqueue(item: T) {
        if !isFull {
            rear = rear + 1
            items[rear] = item
        }
        else {
            print("Queue is full")
        }
    }
    
    mutating func dequeue(item: T) -> T? {
        if !isEmpty {
            front  = front + 1
            return items.remove(at: front)
        }
        else {
            return nil
        }
    }
}

/**
 Circular Queue Data Structure

 A circular queue is the extended version of a regular queue where the last element is connected to the first element. Thus forming a circle-like structure.
 
 The circular queue solves the major limitation of the normal queue. In a normal queue, after a bit of insertion and deletion, there will be non-usable empty space.
 
 How Circular Queue Works
 Circular Queue works by the process of circular increment i.e. when we try to increment the pointer and we reach the end of the queue, we start from the beginning of the queue.

 
 1. Enqueue Operation
 check if the queue is full
 for the first element, set value of FRONT to 0
 circularly increase the REAR index by 1 (i.e. if the rear reaches the end, next it would be at the start of the queue)
 add the new element in the position pointed to by REAR
 
 2. Dequeue Operation
 check if the queue is empty
 return the value pointed by FRONT
 circularly increase the FRONT index by 1
 for the last element, reset the values of FRONT and REAR to -1
 
 Here, the circular increment is performed by modulo division with the queue size. That is,
 if REAR + 1 == 5 (overflow!), REAR = (REAR + 1)%5 = 0 (start of queue)
 
 
 
 Circular Queue Complexity Analysis
 The complexity of the enqueue and dequeue operations of a circular queue is O(1) for (array implementations).

 Applications of Circular Queue
 CPU scheduling
 Memory management
 Traffic Management
 
 */






