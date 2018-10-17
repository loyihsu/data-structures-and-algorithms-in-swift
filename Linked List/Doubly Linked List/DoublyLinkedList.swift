//
//  DoublyLinkedList.swift
//  
//
//  Created by Loyi on 10/17/18.
//

import Foundation

class Node {
    
    // Nodes of the doubly linked list
    
    init (value: Any) {
        // Initializer
        data = value
        prev = nil
        next = nil
    }
    
    var data: Any
    var prev: Node?
    var next: Node?
}

class DoublyLinkedList {
    
    init () {
        // Initializer
        
        head = nil
        tail = nil
    }
    
    // Subscript
    //  - DoublyLinkedList[index].data
    subscript (index: Int) -> Node? {
        get {
            if length == 0 {
                print("Error: The list is empty.")
                return nil
            } else if index >= length || index < 0 {
                print("Error: Index [\(index)] is out of range.")
                return nil
            }
            
            var cur = tail
            
            if index < length / 2
            {
                // The first half of the list
                cur = head
                var count = 0
                
                while count < index {
                    cur = cur?.next
                    count += 1
                }
            } else {
                // The second half of the list
                var count = length - 1
                while count > index {
                    cur = cur?.prev
                    count -= 1
                }
            }
            return cur
        }
        
        set (newValue) {
            if length == 0 {
                print("Error: Nothing in the list yet.")
            } else if index >= length || index < 0 {
                print("Error: Index [\(index)] is out of range.")
            }
            
            var cur = tail
            
            if index < length / 2
            {
                // The first half of the list
                cur = head
                var count = 0
                
                while count < index {
                    cur = cur?.next
                    count += 1
                }
            } else {
                // The second half of the list
                var count = length - 1
                while count > index {
                    cur = cur?.prev
                    count -= 1
                }
            }
            
            cur?.data = newValue as Any
        }
    }
    
    func isEmpty() -> Bool {
        // Return whether the list is empty
        return (head == nil)
    }
    
    func clear() {
        // Clear the linked list
        head = nil
        tail = nil
    }
    
    // MARK: - Add Elements
    
    func pushHead(data: Any) {
        // Add an element to the front
        
        let newNode = Node.init(value: data)
        
        if head != nil {
            // If there are already elements in the list.
            newNode.next = head         // [newNode] -> [head]
            head = newNode              // [head (newNode)] -> [old head]
            head?.next?.prev = head     // [head (newNode)] <--> [old head]
        } else {
            // There is no element in the list
            head = newNode              // [head (newNode)]
            tail = newNode              // Point the tail to the head
        }
    }
    
    func pushTail(data: Any) {
        // Add an element to the end
        
        let newNode = Node.init(value: data)
        
        if head != nil {
            // If there are already elements in the list.
            newNode.prev = tail
            tail?.next = newNode
            tail = newNode
        } else {
            // There is no element in the list
            head = newNode              // [head (newNode)]
            tail = newNode              // Point the tail to the head
        }
        
    }
    
    func insertAt(index: Int, data: Any) {
        // Insert data at the assigned index of the list
        // - The index counts from 0 to length-1
        
        if index == 0 {
            // Add element to the front
            pushHead(data: data)
        } else if index == length {
            // Add element to the end
            pushTail(data: data)
        } else if index < length {
            // Add the element at the assigned index
            var count = 0
            var cur = head
            
            while count < index - 1 {
                cur = cur?.next
                count += 1
            }
            
            // Call the private function to insert at the assigned place
            insertBetween(before: cur!, after: (cur?.next)!, data: data)
        } else {
            // Handle index out of range
            print("insertAt Error: Index [\(index)] is out of range.")
        }
    }
    
    // MARK: - Delete elements
    
    func popHead() {
        // Delete the first element from the list
        if head != nil {
            if head?.next == nil {
                // Handling the case where there is only the last element to delete
                head = nil
                tail = nil
            } else {
                head = head?.next   // [old head] <-X [head] -> ...
                head?.prev = nil    // [old head] XX [head] -> ...
            }
        } else {
            // Error handling
            print("popHead Error: The list is empty")
        }
    }
    
    func popTail() {
        // Delete the last element from the list
        if head != nil {
            if head?.next == nil {
                // Handling the case where there is only the last element to delete
                head = nil
                tail = nil
            } else {
                tail = tail?.prev
                tail?.next = nil
            }
        } else {
            // Error handling
            print("popTail Error: The list is empty.")
        }
    }
    
    func removeAt(index: Int) {
        
        // Insert data at the assigned index of the list
        // - The index counts from 0 to length-1
        
        if index == 0 {
            // Delete the element at front
            popHead()
        } else if index == length - 1 {
            // Delete the element at the end
            popTail()
        } else if index < length {
            // Delete the element at the assigned index
            
            var count = 0
            var cur = head
            
            while count < index {
                cur = cur?.next
                count += 1
            }
            
            // Call the private function to delete at the assigned place
            removeBetween(before: (cur?.prev)!, after: (cur?.next)!)
        } else {
            // Handle index out of range
            print("removeAt Error: Index [\(index)] is out of range.")
        }
    }
    
    // MARK: Private functions
    
    private func insertBetween(before: Node, after: Node, data: Any){
        // Insert at between 'before' and 'after'
        let newNode = Node.init(value: data)
        
        before.next = newNode   // [before] -> newNode
        after.prev = newNode    // [before] -> newNode <- [after]
        
        newNode.next = after    // [before] -> newNode <--> [after]
        newNode.prev = before   // [before] <--> newNode <--> [after]
    }
    
    private func removeBetween(before: Node, after: Node)
    {
        // Remove between 'before' and 'after'
        // - [before] <--> [deleteThis] <--> [after]
        
                                //          <------------------->
        before.next = after     // [before] <-X [deleteThis] <--> [after]
                                //          <-X [deleteThis] X->
        after.prev = before     // [before] <------------------> [after]
        
    }
    
    func printList() {
        // Print the list
        
        if head != nil {
            var cur = head
            
            while cur != nil {
                
                if cur?.next == nil {
                    print(cur?.data ?? "")
                } else {
                    print(cur?.data ?? "", terminator: ", ")
                }
                cur = cur?.next
            }
        } else {
            // Empty list handling
            print("The list is empty.")
        }
        
        
    }
    
    var head: Node?         // head element
    var tail: Node?         // tail element
    var length: Int {       // length of the list
        var count = 0
        var cur = head
        
        while cur != nil {
            cur = cur?.next
            count += 1
        }
        return count
    }
}

