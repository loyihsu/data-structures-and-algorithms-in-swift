//
//  SinglyLinkedList.swift
//
//
//  Created by Loyi on 10/16/18.
//

import Foundation

class Node {
    
    // Nodes of the linked list
    
    init (value: Any) {
        // Initializer
        
        data = value
        next = nil
    }
    
    var data: Any
    var next: Node?
}

class SinglyLinkedList {
    
    init () {
        // Initializer
        
        head = nil
        tail = nil
    }
    
    // Subscript
    //  - SinglyLinkedList[index].data
    subscript (index: Int) -> Node? {
        get {
            if length == 0 {
                print("Error: The list is empty.")
                return nil
            } else if index >= length || index < 0 {
                print("Error: Index [\(index)] is out of range.")
                return nil
            }
            
            var cur = head
            var count = 0
            
            while count < index {
                cur = cur?.next
                count += 1
            }
            
            return cur
        }
        
        set (newValue) {
            if length == 0 {
                print("Error: Nothing in the list yet.")
            } else if index >= length || index < 0 {
                print("Error: Index [\(index)] is out of range.")
            }
            
            var cur = head
            var count = 0
            
            while count < index {
                cur = cur?.next
                count += 1
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
        // Add a new element to the front
        
        let newNode = Node.init(value: data)
        
        if head != nil {
            // If there are already elements in the list.
            newNode.next = head     // [newNode] -> [head]
            head = newNode          // [head (newNode)] -> [old head]
        } else {
            // There is no element in the list
            head = newNode          // [head (newNode)]
            tail = head             // Point the tail to the head
        }
    }
    
    func pushTail(data: Any) {
        // Add a new element to the end
        
        let newNode = Node.init(value: data)
        
        if head != nil {
            // If there is already elements in the list
            tail?.next = newNode    // ... -> [tail] -> [newNode]
            tail = newNode          // ... -> [old tail] -> [tail (newNode)]
        } else {
            // If there is no element in the list
            head = newNode          // [head (newNode)]
            tail = head             // Point the tail to the head
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
                head = nil
                tail = nil
            } else {
                head = head?.next
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
                // Only one element inside
                head = nil
                tail = nil
            } else {
                // More than one element
                var cur = head
                
                while cur?.next?.next != nil
                {
                    cur = cur?.next
                }
                
                cur?.next = nil
                tail = cur
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
            
            while count < index - 1 {
                cur = cur?.next
                count += 1
            }
            
            // Call the private function to delete at the assigned place
            removeBetween(before: cur!, after: (cur?.next?.next)!)
            
        } else {
            // Handle index out of range
            print("removeAt Error: Index [\(index)] is out of range.")
        }
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
    
    // MARK: Private functions
    
    private func insertBetween(before: Node, after: Node, data: Any){
        // Insert at between 'before' and 'after'
        let newNode = Node.init(value: data)
        
        newNode.next = after        // newNode -> [after]
        before.next = newNode       // [before] -> newNode -> after
    }
    
    private func removeBetween(before: Node, after: Node)
    {
        // Remove between 'before' and 'after'
        // - [before] -> delete this -> [after]
        
        before.next = after         // [before] -> [after]
    }
    
    // MARK: Elements
    
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
