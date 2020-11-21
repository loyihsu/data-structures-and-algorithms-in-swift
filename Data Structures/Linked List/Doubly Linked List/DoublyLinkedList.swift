//
//  DoublyLinkedList.swift
//
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 10/17/18.
//

import Foundation

class Node: Equatable {

    // Nodes of the linked list

    // MARK: - Initialiser

    /// Initializer for a new Node. Provide a value and the next element will be predefined as nil.
    init(_ value: Int, prev: Node? = nil, next: Node? = nil) {
        self.value = value
        self.prev = prev
        self.next = next
    }

    // MARK: - Equatable

    /// To make the node equatable.
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.id == rhs.id
    }

    // MARK: - Properties

    /// The ID to make equatable.
    private let id = UUID()

    /// The value of the node
    var value: Int

    /// The previous Node of the Node.
    var prev: Node?

    /// The next Node of the Node.
    var next: Node?
}

class DoublyLinkedList {

    // MARK: - Inserting functions

    /// A function that pushs an Node with the data to the head of the list.
    func prepend(_ value: Int) {
        let newNode = Node(value)
        if isEmpty {
            head = newNode      // [head (newNode)]
            tail = newNode      // Point the tail to the head
        } else {
            newNode.next = head     // [newNode] -> [head]
            head = newNode          // [head (newNode)] -> [old head]
            head?.next?.prev = head // [head (newNode)] <--> [old head]
        }
    }

    /// A function that pushs an Node with the data to the tail of the list.
    func append(_ value: Int) {
        let newNode = Node(value)
        if isEmpty {
            head = newNode      // [head (newNode)]
            tail = newNode      // Point the tail to the head
        } else {
            newNode.prev = tail     // [tail] <- [newNode]
            tail?.next = newNode    // [tail] <--> [newNode]
            tail = newNode          // [old tail] <--> [tail (newNode)]
        }
    }
    // MARK: - Deleting functions

    /// A function that pops the head Node of the list.
    func popHead() {
        if head == tail {
            clear()
            return
        }
        head = head?.next
        head?.prev = nil
    }

    /// A function that pops the tail Node of the list.
    func popTail() {
        if head == tail {
            clear()
            return
        }
        tail = tail?.prev
        tail?.next = nil
    }

    /// Remove specified Node from the list.
    func remove(_ node: Node) {
        if node == head {
            popHead()
        } else if node == tail {
            popTail()
        } else {
            var temp = head
            while let cur = temp {
                if cur.next == node {
                    cur.next = cur.next?.next
                    cur.next?.prev = cur
                    break
                }
                temp = cur.next
            }
        }
    }

    // MARK: - List handling function

    /// A function that clears the whole list.
    func clear() {
        head = nil
        tail = nil
    }

    /// A function that reserves the list.
    func reverse() {
        // This function reverses the whole linked list
        var newNext: Node?      // The new next element, the first will have a nil as the next element
        var current: Node? = head   // The current element
        var newPrev: Node?      // The new previous element
        // nil <-X 0 (head, cur) <--> 1 <--> 2 <--> 3 <--> nil
        while let cur = current {
            newPrev = cur.next     // nil           X  0 (cur)          -> 1 (newPrev)
            cur.next = newNext     // nil (newNext) <- 0 (cur)           X 1 (newPrev)
            cur.prev = newPrev     // nil (newNext) <- 0 (cur)          -> 1 (newPrev)
            newNext = current      // nil           <- 0 (newNext, cur) -> 1 (newPrev)
            current = newPrev      // nil           <- 0 (newNext)      -> 1 (cur, newPrev)
        }
        tail = head     // Move the tail index to the head
        head = newNext  // Move the head index to the new head (original tail)
    }

    // MARK: - Printing function

    /// A function that prints out the list.
    func printList() {
        if isEmpty {
            print("Empty List")
            return
        }
        var temp = head
        while let cur = temp {
            if temp != head {
                print(" -> ", terminator: "")
            }
            print(cur.value, terminator: "")
            temp = cur.next
        }
        print("")
    }

    // MARK: - Properties

    /// The head element of the list.
    var head: Node?

    /// The tail element of the list.
    var tail: Node?

    /// A Bool that indicates whether the list is empty or not.
    var isEmpty: Bool { head == nil }
}
