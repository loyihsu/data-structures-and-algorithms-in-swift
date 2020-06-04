//
//  DoublyLinkedList.swift
//
//
//  Created by Loyi on 10/17/18.
//

import Foundation

class Node {
    
    // Nodes of the doubly linked list
    
    /**
     Initializer for a new Node. Provide a value and the prev and next elements will be predefined as nil.
     */
    
    init (value: Any) {
        data = value
        prev = nil
        next = nil
    }
    /**
     A variable storing the data of the Node.
     */
    var data: Any
    /**
     The previous Node of the current Node.
     */
    var prev: Node?
    /**
     The next Node of the current Node.
     */
    var next: Node?
}

class DoublyLinkedList {
    
    // The doubly linked list.
    
    /**
     Initializer of the Doubly Linked List.
     */
    
    init () {
        head = nil
        tail = nil
    }
    
    // Subscript
    //  - DoublyLinkedList[index].data
    subscript (index: Int) -> Node? {
        get {
            if size == 0 {
                print("Error: The list is empty.")
                return nil
            } else if index >= size || index < 0 {
                print("Error: Index [\(index)] is out of range.")
                return nil
            }
            
            var cur = tail
            
            if index < size / 2
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
                var count = size - 1
                while count > index {
                    cur = cur?.prev
                    count -= 1
                }
            }
            return cur
        }
        
        set (newValue) {
            if size == 0 {
                print("Error: Nothing in the list yet.")
            } else if index >= size || index < 0 {
                print("Error: Index [\(index)] is out of range.")
            }
            
            var cur = tail
            
            if index < size / 2
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
                var count = size - 1
                while count > index {
                    cur = cur?.prev
                    count -= 1
                }
            }
            
            cur?.data = newValue as Any
        }
    }
    
    /**
     A function that clears the whole list.
     */
    func clear() {
        // Clear the linked list
        head = nil
        tail = nil
    }
    
    // MARK: - Add Elements
    /**
     A function that pushs an Node with the data to the head of the list.
     */
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
    
    /**
     A function that pushs an Node with the data to the tail of the list.
     */
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
    
    /**
     A function that insert a Node with the data at the assigned index of the list.
     */
    func insertAt(index: Int, data: Any) {
        // Insert data at the assigned index of the list
        // - The index counts from 0 to length-1
        
        if index == 0 {
            // Add element to the front
            pushHead(data: data)
        } else if index == size {
            // Add element to the end
            pushTail(data: data)
        } else if index < size {
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
    /**
     A function that pops the head Node of the list.
     */
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
    /**
     A function that pops the tail Node of the list.
     */
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
    /**
     A function that pops the Node at the assigned index of the list.
     */
    func removeAt(index: Int) {
        
        // Insert data at the assigned index of the list
        // - The index counts from 0 to length-1
        
        if index == 0 {
            // Delete the element at front
            popHead()
        } else if index == size - 1 {
            // Delete the element at the end
            popTail()
        } else if index < size {
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
    
    /**
     A function that prints out the list.
     */
    func printList() {
        if head != nil {
            // If there is a list.
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
    
    /**
     A private function that inserts a Node with data between the `before` Node and the `after` Node
     */
    private func insertBetween(before: Node, after: Node, data: Any){
        // Insert at between 'before' and 'after'
        let newNode = Node.init(value: data)
        
        before.next = newNode   // [before] -> newNode
        after.prev = newNode    // [before] -> newNode <- [after]
        
        newNode.next = after    // [before] -> newNode <--> [after]
        newNode.prev = before   // [before] <--> newNode <--> [after]
    }
    
    /**
     A private function that removes the Node(s) between the `before` Node and the `after` Node
     */
    private func removeBetween(before: Node, after: Node)
    {
        // Remove between 'before' and 'after'
        // - [before] <--> [deleteThis] <--> [after]
        
        //          <------------------->
        before.next = after     // [before] <-X [deleteThis] <--> [after]
        //          <-X [deleteThis] X->
        after.prev = before     // [before] <------------------> [after]
        
    }
    
    // MARK: Elements
    
    /**
     The head element of the list.
     */
    var head: Node?
    
    /**
     The tail element of the list.
     */
    var tail: Node?
    
    /**
     An Int that indicates the size of the list.
     */
    var size: Int {
        var count = 0
        var cur = head
        
        while cur != nil {
            cur = cur?.next
            count += 1
        }
        return count
    }
    
    /**
     A Bool that indicates whether the list is empty or not.
     */
    var isEmpty: Bool {
        get {
            return (head == nil)
        }
    }
}
