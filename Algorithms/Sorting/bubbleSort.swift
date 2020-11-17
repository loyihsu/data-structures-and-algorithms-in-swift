//
//  bubbleSort.swift
//
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 6/6/20.
//

extension Array where Element == Int {
    /// The function to perform bubble sort on the array. 
    mutating func bubbleSort() {
        for i in 0..<self.count - 1 {
            for j in 0..<self.count - i - 1 {
                if self[j] > self[j+1] {
                    swapAt(j, j+1)
                }
            }
        }
    }
    /// The function to return the result of bubble sort of the array.
    func bubbleSorted() -> [Element] {
        var array = self
        array.bubbleSort()
        return array
    }
}
