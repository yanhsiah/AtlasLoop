//
//  Q896_MonotonicArray.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/25.
//

import Foundation

class MonotonicArray {
    // time: O(N), space: O(1)
    func isMonotonic(_ A: [Int]) -> Bool {
        guard A.count > 1 else { return true }
        var inc = true, dec = true
        for i in 1..<A.count {
            if A[i-1] < A[i] { dec = false }
            else if A[i-1] > A[i] { inc = false }
            if !inc && !dec { return false }
        }
        return true
    }
}
