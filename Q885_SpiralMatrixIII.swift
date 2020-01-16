//
//  Q885_SpiralMatrixIII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/16.
//

import Foundation

class SpiralMatrixIII {
    // Steps are 1,1,2,2,3,3,4,4,...
    // i-th step = i / 2 + 1
    // time: O(max(R,C)^2), space: O(1) if not count output
    let dy = [0, 1, 0, -1], dx = [1, 0, -1, 0]
    func spiralMatrixIII(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        var res = [[r0, c0]], i = 0, y = r0, x = c0
        while res.count < R * C {
            let d = i % 4
            for _ in 0..<(i / 2 + 1) {
                y += dy[d]
                x += dx[d]
                if y < 0 || y >= R || x < 0 || x >= C { continue }
                res.append([y, x])
            }
            i += 1
        }
        return res
    }
}
