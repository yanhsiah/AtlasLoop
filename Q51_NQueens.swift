//
//  Q51_NQueens.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/5.
//

import Foundation

class NQueens {
    // time: O(N^N), space: O(N^2)
    func solveNQueens(_ n: Int) -> [[String]] {
        var res = [[String]]()
        var sol = [[String]](repeating: [String](repeating: ".", count: n), count: n)
        dfs(&res, &sol, n, 0)
        return res
    }
    
    // Place queen row by row, no need to check row
    func dfs(_ res: inout [[String]], _ sol: inout [[String]], _ n: Int, _ y: Int) {
        if y == n {
            res.append(sol.map { $0.joined(separator: "") })
            return
        }
        for x in 0..<n where isValid(sol, y, x) {
            sol[y][x] = "Q"
            queens.append((y, x))

            dfs(&res, &sol, n, y + 1)

            sol[y][x] = "."
            queens.removeLast()
        }
    }

    var queens = [(Int, Int)]()
    func isValid(_ sol: [[String]], _ y: Int, _ x: Int) -> Bool {
        // Check col, diagnol
        for (qy, qx) in queens where qx == x || abs(qx - x) == abs(qy - y) { return false }
        return true
    }
}
