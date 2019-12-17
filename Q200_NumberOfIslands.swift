//
//  Q200_NumberOfIslands.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/17.
//

import Foundation

class NumberOfIslands {
    // time: O(N), space: O(N)
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 && grid[0].count > 0 else { return 0 }
        let rows = grid.count, cols = grid[0].count
        
        var grid = grid
        var count = 0
        for y in 0..<rows {
            for x in 0..<cols {
                if grid[y][x] == "1" {
                    count += 1
                    dfs(&grid, rows, cols, y, x)
                }
            }
        }
        return count
    }

    let dy = [-1, 0, 1, 0]
    let dx = [0, 1, 0, -1]
    func dfs(_ grid: inout [[Character]], _ rows: Int, _ cols: Int, _ y: Int, _ x: Int) {
        guard y >= 0 && y < rows && x >= 0 && x < cols && grid[y][x] == "1" else { return }
        grid[y][x] = "0"
        for d in 0..<4 { dfs(&grid, rows, cols, y + dy[d], x + dx[d]) }
    }
    func bfs(_ grid: inout [[Character]], _ rows: Int, _ cols: Int, _ sy: Int, _ sx: Int) {
        var q = [(sy, sx)]
        while !q.isEmpty {
            let (y, x) = q.removeFirst()
            guard y >= 0 && y < rows && x >= 0 && x < cols && grid[y][x] == "1" else { continue }
            grid[y][x] = "0"
            for d in 0..<4 { q.append((y + dy[d], x + dx[d])) }
        }
    }
}
