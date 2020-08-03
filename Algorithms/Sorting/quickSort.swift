//
//  quickSort.swift
//  
//
//  Created by Loyi on 2020/6/6.
//

import Foundation

extension Array where Element == Int {
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
}
