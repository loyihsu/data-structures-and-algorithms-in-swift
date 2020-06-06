//
//  Queue.swift
//
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 10/16/18.
//

import Foundation

class Queue {

    init() {
        // Initializer
    }

    /// A function that pushs the element to the Rear end of the Queue.
    func push(_ element: Any) {
        queue.append(element)
    }

    /// A function that pops the Front element from the Queue and return the element.
    func pop() -> Any? {
        if queue.isEmpty {
            return nil
        } else {
            return queue.removeFirst()
        }

    }

    /// An Int that indicates the size of the Queue.
    var count: Int { queue.count }

    /// A Bool that indicates whether the Queue is empty or not.
    var isEmpty: Bool { queue.isEmpty }

    /// A function that returns the Front element of your Queue.
    var front: Any? { queue.first }

    /// A function that returns the Rear element of your Queue.
    var rear: Any? { queue.last }

    // A private array to store the Queue.
    private var queue = [Any]()

}