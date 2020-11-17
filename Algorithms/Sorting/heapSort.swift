//
//  heapSort.swift
//
//  # Data Structures & Algorithms in Swift
//  Created by Loyi on 11/18/20.
//
//  To utilise this file, you would also need to add the Heap code from the Data Structures folder to your code base.

extension Array where Element == Int {
    mutating func heapSort(reversed: Bool = false) {
        self = self.heapSorted(reversed: reversed)
    }
    func heapSorted(reversed: Bool = false) -> [Int] {
        var res = self, count = 0
        let heap = Heap.init(res, mode: reversed == false ? "min" : "max")
        while let r = heap.extractRoot() {
            res[count] = r
            count += 1
        }
        return res
    }
}
