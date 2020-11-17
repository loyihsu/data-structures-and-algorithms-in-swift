//
//  Stack.swift
//  
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 10/16/18.
//

import Foundation

class Stack<Item> {
    /// Initialiser
    init() { }

    /// A function that pushs the element to the Top of the Stack.
    func push(_ element: Item) { stack.append(element) }

    /// A function that pops the Top element from the Stack and returns the element.
    func pop() -> Item? { stack.popLast() }

    /// An Int that indicates the size of the Stack.
    var count: Int { stack.count }

    /// A Bool that indicates whether the Stack is empty or not.
    var isEmpty: Bool { stack.isEmpty }

    /// A variable that dynamically returns the Top element of the Stack.
    var top: Item? { stack.last }

    // A private array that store the items in the array.
    private var stack = [Item]()
}
