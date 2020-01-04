//
//  Q766_ToeplitzMatrix.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/4.
//

import Foundation

class Solution {
    // time: O(MN), space: O(1)
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        for y in 0..<matrix.count {
            for x in 0..<matrix[0].count {
                if y > 0 && x > 0 && matrix[y-1][x-1] != matrix[y][x] {
                    return false
                }
            }
        }
        return true
    }
}
