//
//  Queue.swift
//
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 10/16/18.
//

import Foundation

class Queue<Item> {
    /// Initialiser
    init() { }

    /// A function that enqueues the element to the Rear end of the Queue.
    func enqueue(_ element: Item) {
        queue.append(element)
    }
    /// A function that dequeues the Front element from the Queue and return the element.
    func dequeue() -> Item? {
        queue.isEmpty ? nil : queue.removeFirst()
    }

    /// An Int that indicates the size of the Queue.
    var count: Int { queue.count }

    /// A Bool that indicates whether the Queue is empty or not.
    var isEmpty: Bool { queue.isEmpty }

    /// A variable that returns the Front element of your Queue.
    var front: Item? { queue.first }

    /// A variable that returns the Rear element of your Queue.
    var rear: Item? { queue.last }

    // A private array to store the Queue.
    private var queue = [Item]()
}
