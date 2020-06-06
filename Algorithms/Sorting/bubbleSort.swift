//
//  bubbleSort.swift
//  
//
//  Created by Loyi on 2020/6/6.
//

import Foundation

extension Array where Element == Int {
    mutating func bubbleSort() {
        for i in 0..<self.count - 1 {
            for j in 0..<self.count - i - 1 {
                if self[j] > self[j+1] {
                    swapAt(j, j+1)
                }
            }
        }
    }
}
