//
//  Queue.swift
//
//
//  Created by Loyi on 10/16/18.
//

import Foundation

class Queue {
    
    init() {
        // Initializer
    }
    
    /**
     A function that returns the Front element of your Queue.
     */
    func Front() -> Any? {
        return queue.first
    }
    
    /**
     A function that returns the Rear element of your Queue.
     */
    func Rear() -> Any? {
        return queue.last
    }
    
    /**
     A function that pushs the element to the Rear end of the Queue.
     */
    func Push(element: Any) {
        queue.append(element)
    }
    
    /**
     A function that pops the Front element from the Queue.
     */
    func Pop() {
        queue.removeFirst()
    }
    
    /**
     An Int that indicates the size of the Queue.
     */
    var size: Int {
        get {
            return queue.count
        }
    }
    
    /**
     A Bool that indicates whether the Queue is empty or not.
     */
    var isEmpty: Bool {
        get {
            return queue.isEmpty
        }
    }
    
    // A private array to store the Queue.
    private var queue = [Any]()
}
