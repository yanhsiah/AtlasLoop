//
//  Q59_SpiralMatrixII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/15.
//

import Foundation

class SpiralMatrixII {
    // time: O(N), space: O(1)
    func generateMatrix(_ n: Int) -> [[Int]] {
        var c1 = 0, c2 = n - 1, r1 = 0, r2 = n - 1
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: n), num = 1
        while r1 <= r2 && c1 <= c2 {
            for c in c1...c2 { res[r1][c] = num; num += 1 }
            r1 += 1
            
            guard r1 <= r2 else { break }
            for r in r1...r2 { res[r][c2] = num; num += 1 }
            c2 -= 1
            
            guard c1 <= c2 else { break }
            var c = c2
            while c >= c1 { res[r2][c] = num; c -= 1; num += 1 }
            r2 -= 1
            
            var r = r2
            while r >= r1 { res[r][c1] = num; r -= 1; num += 1 }
            c1 += 1
        }
        return res
    }
}
