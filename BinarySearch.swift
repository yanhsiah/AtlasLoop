//
//  BinarySearch.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

extension Array where Element == Int {
    // return Index of the first element >= target
    func lowerBound(_ target: Int) -> Int {
        var start = 0, end = self.count - 1
        while start < end {
            let m = start + (end - start) / 2
            if self[m] < target { start = m + 1 }
            else { end = m }
        }
        return start
    }
    // return Index of the last element >= target
    func upperBound(_ target: Int) -> Int {
        var start = 0, end = self.count - 1
        while start < end {
            let m = start + (end - start) / 2
            if self[m] <= target { start = m + 1 }
            else { end = m }
        }
        return start
    }
    // return Index of the insert position
    func findInsertPos(_ target: Int) -> Int {
        var start = 0, end = self.count - 1
        while start <= end {
            let m = start + (end - start) / 2
            if self[m] == target { return m }
            if self[m] < target { start = m + 1 }
            else { end = m - 1 }
        }
        return start
    }
}
