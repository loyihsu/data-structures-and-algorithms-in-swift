//
//  Heap.swift
//  
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 11/18/20.
//

class Heap {
    /// Initialiser with mode specified.
    /// - parameter mode: Give "max" to generate max heap, or "min" to generate min heap. Leave it empty would default to a max heap.
    init(mode: String = "max") { 
        self.mode = mode
    }

    /// Initialiser with pre-existing array and mode specifier.
    /// - parameter array: Give the array to be made into a heap.
    /// - parameter mode: Give "max" to generate max heap, or "min" to generate min heap. Leave it empty would default to a max heap.
    init(_ array: [Int], mode: String = "max") {
        self.mode = mode
        self.array.append(contentsOf: array)
        heapify()
    }

    /// A private function that heapifies the array in O(N) time.
    private func heapify() {
        var pos = array.count - 1
        while pos > 0 {
            bubbleDown(pos: pos)
            pos -= 1
        }
    }
    
    /// A private function to bubble up an element at an position.
    /// - parameter pos: The position of the element to be dealt with.
    private func bubbleUp(pos: Int) {
        var temp = pos
        while temp / 2 > 0 {
            if mode == "max" && array[temp/2] < array[temp] || mode == "min" && array[temp/2] > array[temp] {
                let item = array[temp]
                array[temp] = array[temp/2]
                array[temp/2] = item
                temp /= 2
            } else {
                break
            }
        }
    }

    /// A private function to bubble down an element at an position.
    /// - parameter pos: The position of the element to be dealt with.
    private func bubbleDown(pos: Int) {
        var temp = pos
        while 2 * temp < array.count {
            var comparing = (array[2*temp], 2*temp)
            if 2 * temp + 1 < array.count && (mode == "max" && array[2*temp+1] > array[2*temp] || mode == "min" && array[2*temp+1] < array[2*temp]) {
                comparing.1 = 2*temp+1
                comparing.0 = array[comparing.1]
            }
            if mode == "max" && array[temp] < comparing.0 || mode == "min" && array[temp] > comparing.0 {
                array[comparing.1] = array[temp]
                array[temp] = comparing.0
                temp = comparing.1
            } else {
                break
            }
        }
    }

    /// A function to insert a new item into the heap.
    /// - parameter newItem: The new item to be added to the heap.
    func insert(_ newItem: Int) {
        array.append(newItem)
        bubbleUp(pos: array.count - 1)
    }

    /// A function to extract the element at the root of the heap. For max heap, it's the max item; for min heap, it's the min item. 
    /// It would automatically heapify the extracted tree.
    func extractRoot() -> Int? {
        guard array.count > 1 else { return nil }
        if array.count > 2 {
            let temp = array[array.count-1]
            array[array.count-1] = array[1]
            array[1] = temp
        }
        let output = array.popLast()
        bubbleDown(pos: 1)
        return output
    }
    
    /// The variable that returns count of the item in the heap.
    var count: Int { array.count - 1 }

    /// The variable to return the item at the root position without extracting it.
    var root: Int? { array.count == 1 ? nil : array.last }

    /// The variable to return whether the heap is empty.
    var isEmpty: Bool { array.count == 1 }
    
    /// The private variable that stores the mode of the heap. (`"max"` for max heap, `"min"` for min heap.)
    private var mode: String

    /// The private array to store the heap. Defaults to [0] for convenience.
    private var array: [Int] = [0]
}
