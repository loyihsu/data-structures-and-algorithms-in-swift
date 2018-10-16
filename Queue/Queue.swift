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
    
    func isEmpty() -> Bool {
        // This function returns whether the queue is empty
        return queue.isEmpty
    }
    
    func Size() -> Int {
        // This function returns the size of the queue
        return queue.count
    }
    
    func Front() -> Any? {
        // This function returns the element at the front end of the queue
        return queue.first
    }
    
    func Rear() -> Any? {
        // This function returns the element at the rear end of the queue
        return queue.last
    }
    
    func Push(element: Any) {
        // This function pushs the new element at the rear end of the queue
        queue.append(element)
    }
    
    func Pop() {
        // This function pops the element at the front end of the queue
        queue.removeFirst()
    }
    
    private var queue = [Any]() // A private array to store the queue
}

