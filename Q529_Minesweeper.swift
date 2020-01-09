//
//  Q529_Minesweeper.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/9.
//

import Foundation

class Minesweeper {
    
    // time: O(MN), space: O(M+N)
    let dy = [-1,-1,0,1,1,1,0,-1], dx = [0,1,1,1,0,-1,-1,-1]
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        // if board.isEmpty || board[0].isEmpty { return board }
        let rows = board.count, cols = board[0].count, y = click[0], x = click[1]
        var board = board
        if board[y][x] == "M" {
            board[y][x] = "X"
        } else if board[y][x] == "E" {
            var q = [(y, x)]
            while !q.isEmpty {
                var nq = [(Int, Int)]()
                for (y, x) in q {
                    guard y >= 0 && y < rows && x >= 0 && x < cols && board[y][x] == "E" else { continue }
                    var count = 0
                    for row in max(y - 1, 0)...min(y + 1, rows - 1) {
                        for col in max(x - 1, 0)...min(x + 1, cols - 1) {
                            if row == y && col == x { continue }
                            if board[row][col] == "M" { count += 1 }
                        }
                    }
                    if count > 0 {
                        board[y][x] = Character(String(count))
                    } else {
                        board[y][x] = "B"
                        for d in 0..<8 { nq.append((y + dy[d], x + dx[d])) }
                    }
                }
                swap(&nq, &q)
            }
        }
        return board
    }
}
