//
//  Q304_RangeSumQuery.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/23.
//

import Foundation

class NumMatrix {

    var sum: [[Int]]
    let rows: Int, cols: Int

    // time: O(MN), space: O(1)
    init(_ matrix: [[Int]]) {
        sum = matrix
        rows = sum.count
        cols = rows > 0 ? sum[0].count : 0
        for y in 0..<rows {
            var rowSum = 0
            for x in 0..<cols {
                rowSum += sum[y][x]
                sum[y][x] = rowSum + (y > 0 ? sum[y-1][x] : 0)
            }
        }
    }

    // time: O(1), space: O(1)
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        guard rows > row2 && row2 >= row1 && row1 >= 0 &&
            cols > col2 && col2 >= col1 && col1 >= 0 else { return 0 }
        return sum[row2][col2]
            - (row1 > 0 ? sum[row1-1][col2] : 0)
            - (col1 > 0 ? sum[row2][col1-1] : 0)
            + (row1 > 0 && col1 > 0 ? sum[row1-1][col1-1] : 0)
    }
}
