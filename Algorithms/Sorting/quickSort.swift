//
//  quickSort.swift
//
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 6/6/20.
//

extension Array where Element == Int {
    /// The function to perform quick sort on the array.
    /// - parameter left: The left end of the array. Usually `0`.
    /// - parameter right: The right end of the array. Usually `array.count - 1`.
    mutating func quickSort(left: Int, right: Int) {
        guard left >= 0 && right < self.count && left < right else { return }
        var i = left, j = right
        let standard = self[left]
        
        while i != j {
            while self[j] >= standard && i < j { j -= 1 }
            while self[i] <= standard && i < j { i += 1 }
            if i < j { swapAt(i, j) }
        }
        
        self[left] = self[i]
        self[i] = standard
        
        quickSort(left: left, right: i-1)
        quickSort(left: i+1, right: right)
    }
    /// The function to return the result of quick sort of the array.
    /// - parameter left: The left end of the array. Usually `0`.
    /// - parameter right: The right end of the array. Usually `array.count - 1`.
    func quickSorted(left: Int, right: Int) -> [Element] {
        var array = self
        array.quickSort(left: left, right: right)
        return array
    }
}
