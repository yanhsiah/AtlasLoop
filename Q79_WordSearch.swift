//
//  Q79_WordSearch.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/29.
//

import Foundation

class WordSearch {
    
    // time: O(MN * 4^L): M rows, N cols, word length L
    // space: O(L)
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 && board[0].count > 0 else { return false }
        var board = board
        let rows = board.count, cols = board[0].count
        let s = Array(word)
        for y in 0..<rows {
            for x in 0..<cols {
                if dfs(&board, rows, cols, y, x, s, 0) { return true }
            }
        }
        return false
    }
    
    let dy = [-1,0,1,0]
    let dx = [0,1,0,-1]
    func dfs(_ board: inout [[Character]], _ rows: Int, _ cols: Int, _ y: Int, _ x: Int, _ s: [Character], _ i: Int) -> Bool {
        if i >= s.count { return true }
        if y < 0 || y >= rows || x < 0 || x >= cols || board[y][x] != s[i] { return false }

        let c = board[y][x]
        board[y][x] = "#"
        for d in 0..<4 {
            if dfs(&board, rows, cols, y + dy[d], x + dx[d], s, i + 1) { return true }
        }
        board[y][x] = c
        return false
    }
}
