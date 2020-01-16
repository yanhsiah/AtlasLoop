//
//  Q54_SpiralMatrix.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/15.
//

import Foundation

class SpiralMatrix {
    // time: O(N), space: O(1)
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty || matrix[0].isEmpty { return [] }
        var r1 = 0, r2 = matrix.count - 1, c1 = 0, c2 = matrix[0].count - 1
        var res = [Int]()
        while r1 <= r2 && c1 <= c2 {
            for c in c1...c2 { res.append(matrix[r1][c]) }
            
            guard r1 != r2 else { break }
            for r in r1 + 1...r2 { res.append(matrix[r][c2]) }

            guard c1 != c2 else { break }
            var c = c2 - 1
            while c >= c1 { res.append(matrix[r2][c]); c -= 1 }
            
            var r = r2 - 1
            while r > r1 { res.append(matrix[r][c1]); r -= 1 }
            
            r1 += 1
            r2 -= 1
            c1 += 1
            c2 -= 1
        }
        return res
    }
}
