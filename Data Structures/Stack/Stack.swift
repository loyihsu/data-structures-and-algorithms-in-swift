//
//  Stack.swift
//  
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 10/16/18.
//

import Foundation

class Stack {

    init() {
        // Initializer
    }

    /// A function that pushs the element to the Top of the Stack.
    func push(_ element: Any) {
        stack.append(element)
    }

    /// A function that pops the Top element from the Stack and returns the element.
    func pop() -> Any? { stack.popLast() }

    /// An Int that indicates the size of the Stack.
    var count: Int { stack.count }

    /// A Bool that indicates whether the Stack is empty or not.
    var isEmpty: Bool { stack.isEmpty }

    /// A function that returns the Top element of your Stack.
    var top: Any? { stack.last }

    // A private array to store the Stack.
    private var stack = [Any]()

}
