//
//  Stack.swift
//  
//
//  Created by Loyi on 10/16/18.
//

import Foundation

class Stack {
    
    init() {
        // Initializer
    }
    
    /**
     A function that returns the Top element of your Stack.
     */
    func Top() -> Any? {
        return stack.last
    }
    
    /**
     A function that pushs the element to the Top of the Stack.
     */
    func Push(element: Any) {
        stack.append(element)
    }
    
    /**
     A function that pops the Top element from the Stack.
     */
    func Pop() {
        stack.popLast()
    }
    
    /**
     An Int that indicates the size of the Stack.
     */
    var size: Int {
        get {
            return stack.count
        }
    }
    
    /**
     A Bool that indicates whether the Stack is empty or not.
     */
    var isEmpty: Bool {
        get {
            return stack.isEmpty
        }
    }
    
    // A private array to store the Stack.
    private var stack = [Any]()
}


