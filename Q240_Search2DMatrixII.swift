//
//  Q240_Search2DMatrixII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/12.
//

import Foundation

class Search2DMatrixII {
    // time: O(M+N), space: O(1)
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix[0].isEmpty { return false }
        let rows = matrix.count, cols = matrix[0].count
        var y = rows - 1, x = 0
        while y >= 0 && x < cols {
            if matrix[y][x] == target { return true }
            if matrix[y][x] < target { x += 1 }
            else { y -= 1 }
        }
        return false
    }
}
