//
//  Q969_PancakeSorting.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/4.
//

import Foundation

class PancakeSorting {
    
    // Assume A consists of 1...N where N is A.count.
    // time: O(N^2), space: O(1)
    func pancakeSort(_ A: [Int]) -> [Int] {
        var A = A, res = [Int](), n = A.count
        while n > 0 {
            var i = 0
            while A[i] != n { i += 1 }

            var k = i + 1
            flip(&A, k)
            res.append(k)

            flip(&A, n)
            res.append(n)
            n -= 1
        }
        return res
    }
    func flip(_ A: inout [Int], _ k: Int) {
        var start = 0, end = k - 1
        while start < end {
            A.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}
