//
//  37_SudokuSolver.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/4.
//

import Foundation

class SudokuSolver {

    var rows = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 9),
        cols = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 9),
        boxs = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 9)
    func alter(_ board: inout [[Character]], _ y: Int, _ x: Int, _ c: Character) {
        let insert = c != "."
        guard let d = Int(String(insert ? c : board[y][x])) else { return }
        rows[y][d] = insert
        cols[x][d] = insert
        boxs[bid(y, x)][d] = insert
        board[y][x] = c
    }
    func canAlter(_ y: Int, _ x: Int, _ d: Int) -> Bool {
        return !rows[y][d] && !cols[x][d] && !boxs[bid(y, x)][d]
    }
    func bid(_ y: Int, _ x: Int) -> Int { return y / 3 * 3 + x / 3 }


    // constraints, backtrack
    // time: O(9^81), space: O(3 * 90 + 81)
    func solveSudoku(_ board: inout [[Character]]) {
        for y in 0..<9 {
            for x in 0..<9 where board[y][x] != "." {
                alter(&board, y, x, board[y][x])
            }
        }
        dfs(&board)
    }

    func dfs(_ board: inout [[Character]]) -> Bool {
        for y in 0..<9 {
            for x in 0..<9 where board[y][x] == "." {
                for d in 1...9 where canAlter(y, x, d) {
                    alter(&board, y, x, Character(String(d)))
                    if dfs(&board) { return true }
                    else { alter(&board, y, x, ".") }
                }
                return false
            }
        }
        return true
    }
}
