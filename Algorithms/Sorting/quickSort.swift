//
//  quickSort.swift
//  
//
//  Created by Loyi on 2020/6/6.
//

import Foundation

extension Array where Element == Int {
    mutating func quickSort(left: Int, right: Int) {
        var i = left
        var j = right
        let standard = self[left]

        if left > right { return }

        while i != j {
            while self[j] >= standard && i < j { j -= 1 }
            while self[i] <= standard && i < j { i += 1 }
            if i < j { swapAt(i, j) }
        }

        self[left] = self[i]
        self[i] = standard

        print(self)

        if i - 1 > 0 { quickSort(left: left, right: i-1) }
        if i + 1 < self.count { quickSort(left: i+1, right: right) }
    }
}
