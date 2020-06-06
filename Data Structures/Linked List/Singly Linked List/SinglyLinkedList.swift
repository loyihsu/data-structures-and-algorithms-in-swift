//
//  SinglyLinkedList.swift
//
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 10/16/18.
//

import Foundation

class Node {

    // Nodes of the linked list

    /// Initializer for a new Node. Provide a value and the next element will be predefined as nil.
    init (value: Any) {
        data = value
        next = nil
    }

    /// A variable storing the data of the Node.
    var data: Any

    /// The next Node of the current Node.
    var next: Node?
}

class SinglyLinkedList {

    init () {
        head = nil
        tail = nil
    }

    // Subscript
    //  - SinglyLinkedList[index].data
    subscript (index: Int) -> Node? {
        get {
            if count == 0 {
                print("Error: The list is empty.")
                return nil
            } else if index >= count || index < 0 {
                print("Error: Index [\(index)] is out of range.")
                return nil
            }

            var cur = head
            var c = 0

            while c < index {
                cur = cur?.next
                c += 1
            }

            return cur
        }

        set (newValue) {
            if count == 0 {
                print("Error: Nothing in the list yet.")
            } else if index >= count || index < 0 {
                print("Error: Index [\(index)] is out of range.")
            }

            var cur = head
            var c = 0

            while c < index {
                cur = cur?.next
                c += 1
            }

            cur?.data = newValue as Any
        }
    }

    /// A function that clears the whole list.
    func clear() {
        head = nil
        tail = nil
    }

    // MARK: - Add Elements

    /// A function that pushs an Node with the data to the head of the list.
    func pushHead(_ data: Any) {
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

    /// A function that pushs an Node with the data to the tail of the list.
    func pushTail(_ data: Any) {
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

    /// A function that insert a Node with the data at the assigned index of the list.
    func insert(_ data: Any, at index: Int) {

        // The index counts from 0 to (length-1)

        if index == 0 {
            // Add element to the front
            pushHead(data)
        } else if index == count {
            // Add element to the end
            pushTail(data)
        } else if index < count {
            // Add the element at the assigned index
            var c = 0
            var cur = head

            while c < index - 1 {
                cur = cur?.next
                c += 1
            }

            // Call the private function to insert at the assigned place
            insertBetween(before: cur!, after: (cur?.next)!, data: data)
        } else {
            // Handle index out of range
            print("insertAt Error: Index [\(index)] is out of range.")
        }
    }

    // MARK: - Delete elements

    /// A function that pops the head Node of the list.
    func popHead() {
        if head != nil {
            // If there is a list.
            if head?.next == nil {
                // If the head is the only Node.
                head = nil
                tail = nil
            } else {
                // If the head is not the only Node.
                head = head?.next
            }
        } else {
            // Error handling
            print("popHead Error: The list is empty")
        }

    }

    /// A function that pops the tail Node of the list.
    func popTail() {
        // Delete the last element from the list

        if head != nil {
            // If there is a list.
            if head?.next == nil {
                // If the head is the only Node.
                head = nil
                tail = nil
            } else {
                // If the head is not the only Node.
                var cur = head

                while cur?.next?.next != nil {
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

    /// A function that pops the Node at the assigned index of the list.
    func remove(at index: Int) {

        // - The index counts from 0 to (length-1)

        if index == 0 {
            // Delete the element at front
            popHead()
        } else if index == count - 1 {
            // Delete the element at the end
            popTail()
        } else if index < count {
            // Delete the element at the assigned index

            var c = 0
            var cur = head

            while c < index - 1 {
                cur = cur?.next
                c += 1
            }

            // Call the private function to delete at the assigned place
            removeBetween(before: cur!, after: (cur?.next?.next)!)

        } else {
            // Handle index out of range
            print("removeAt Error: Index [\(index)] is out of range.")
        }
    }

    /// A function that prints out the list.
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

    // MARK: Reverse function

    /// A function that reserves the list.
    func reverse() {
        // This function reverses the whole linked list

        var newNext: Node? = nil        // The new next element, the first will have a nil as the next element
        var current: Node? = head       // The current element
        var newPrev: Node? = nil        // The new previous element

        // nil -> 0 (head, cur) -> 1 -> 2 -> 3 -> nil

        while current != nil {
            newPrev = current?.next     // nil           -> 0 (cur)         -> 1 (newPrev)      -> ...
            current?.next = newNext     // nil (newNext) <- 0 (cur)          X 1 (newPrev)      -> ...
            newNext = current           // nil           <- 0 (newNext, cur) X 1 (newPrev)      -> ...
            current = newPrev           // nil           <- 0 (newNext)      X 1 (cur, newPrev) -> ...
        }

        tail = head                     // Move the tail index to the head
        head = newNext                  // Move the head index to the new head (original tail)
    }

    // MARK: Private functions

    /// A private function that inserts a Node with data between the `before` Node and the `after` Node.
    private func insertBetween(before: Node, after: Node, data: Any){
        // Insert at between 'before' and 'after'
        let newNode = Node.init(value: data)

        newNode.next = after        // newNode -> [after]
        before.next = newNode       // [before] -> newNode -> after
    }

    /// A private function that removes the Node(s) between the `before` Node and the `after` Node.
    private func removeBetween(before: Node, after: Node) {
        // - [before] -> delete this -> [after]

        before.next = after         // [before] -> [after]
    }

    // MARK: Elements

    /// The head element of the list.
    var head: Node?

    /// The tail element of the list.
    var tail: Node?

    /// An Int that indicates the size of the list.
    var count: Int {
        var count = 0
        var cur = head

        while cur != nil {
            cur = cur?.next
            count += 1
        }

        return count
    }

    /// A Bool that indicates whether the list is empty or not.
    var isEmpty: Bool { head == nil }
}
