//
//  Stack.swift
//  Experiment
//
//  Created by Abdullah on 05/06/2022.
//

import Foundation

/** A stack is a linear data structure that follows the principle of Last In First Out (LIFO). This means the last element inserted inside the stack is removed first.
 There are some basic operations that allow us to perform different actions on a stack.

 Push: Add an element to the top of a stack
 Pop: Remove an element from the top of a stack
 IsEmpty: Check if the stack is empty
 IsFull: Check if the stack is full
 Peek: Get the value of the top element without removing it
 
 Working of Stack Data Structure
 The operations work as follows:

 A pointer called TOP is used to keep track of the top element in the stack.
 When initializing the stack, we set its value to -1 so that we can check if the stack is empty by comparing TOP == -1.
 On pushing an element, we increase the value of TOP and place the new element in the position pointed to by TOP.
 On popping an element, we return the element pointed to by TOP and reduce its value.
 Before pushing, we check if the stack is already full
 Before popping, we check if the stack is already empty
 
 
 Applications of Stack Data Structure
 Although stack is a simple data structure to implement, it is very powerful. The most common uses of a stack are:

 To reverse a word - Put all the letters in a stack and pop them out. Because of the LIFO order of stack, you will get the letters in reverse order.
 In compilers - Compilers use the stack to calculate the value of expressions like 2 + 4 / 5 * (7 - 9) by converting the expression to prefix or postfix form.
 In browsers - The back button in a browser saves all the URLs you have visited previously in a stack. Each time you visit a new page, it is added on top of the stack. When you press the back button, the current URL is removed from the stack, and the previous URL is accessed.
 */

struct MyStack<T> {
    
    private var stacks: [T] = []
    
    var isEmpty: Bool {
        stacks.isEmpty
    }
    
    var peek: T? {
        if isEmpty {
            debugPrint("Stack is empty")
            return nil
        }
        return stacks[stacks.count-1]
    }
    
    mutating func push(_ el: T) {
        stacks.append(el)
    }
    
    mutating func pop() -> T? {
        if isEmpty {
            debugPrint("Stack is empty")
            return nil
        }
        return stacks.popLast()
    }
}



func sampleStackUsage() {
    var stringStack = MyStack<String>()
    stringStack.push("Bob")
    stringStack.push("Lam")
    stringStack.push("John")
    stringStack.push("David")
    
    print(stringStack) // Show all names added to the stack
    
    if let lastEntryWithoutRemoving = stringStack.peek {
        print(lastEntryWithoutRemoving) // Return the topmost name
    }
    
    if let lastEntryWithRemoving = stringStack.pop() {
        print(lastEntryWithRemoving) // Return and remove the topmost name
    }
    
    print(stringStack) // Show remaining names in the stack
}


