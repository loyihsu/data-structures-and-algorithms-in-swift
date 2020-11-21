//
//  SinglyLinkedList.swift
//
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 10/16/18.
//

import Foundation

class Node: Equatable {

    // Nodes of the linked list

    // MARK: - Initialiser

    /// Initializer for a new Node. Provide a value and the next element will be predefined as nil.
    init(_ value: Int, next: Node? = nil) {
        self.value = value
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

    /// The next Node of the Node.
    var next: Node?
}

class SinglyLinkedList {

    // MARK: - Inserting functions

    /// A function that pushs an Node with the data to the head of the list.
    func prepend(_ value: Int) {
        let newNode = Node(value)
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }
    }

    /// A function that pushs an Node with the data to the tail of the list.
    func append(_ value: Int) {
        let newNode = Node(value)
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }

    // MARK: - Removing functions

    /// A function that pops the head Node of the list.
    func popHead() {
        if head == tail {
            clear()
            return
        }
        head = head?.next
    }

    /// A function that pops the tail Node of the list.
    func popTail() {
        if head == tail {
            clear()
            return
        }
        var temp = head
        while let cur = temp {
            if cur.next == tail {
                tail = cur
                cur.next = nil
            }
            temp = cur.next
        }
    }

    /// Remove specified Node from the list.
    func remove(_ node: Node) {
        if head == node {
            popHead()
        } else if tail == node {
            popTail()
        } else {
            var temp = head
            while let cur = temp {
                if cur.next == node {
                    cur.next = cur.next?.next
                    break
                }
                temp = cur.next
            }
        }
    }

    // MARK: - List handling functions

    /// Remove all elements from the list.
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
        // nil X 0 (head, cur) -> 1 -> 2 -> 3 -> nil
        while current != nil {
            newPrev = current?.next     // nil           X  0 (cur)         -> 1 (newPrev)
            current?.next = newNext     // nil (newNext) <- 0 (cur)          X 1 (newPrev)
            newNext = current           // nil           <- 0 (newNext, cur) X 1 (newPrev)
            current = newPrev           // nil           <- 0 (newNext)      X 1 (cur, newPrev)
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
