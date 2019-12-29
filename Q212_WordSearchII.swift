//
//  Q212_WordSearchII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/29.
//

import Foundation

class WordSearchII {
    
    // 208
    class TrieNode {
        var next = [Character: TrieNode]()
        var word = ""
    }
    var root = TrieNode()
    func insert(_ word: String) {
        var ptr = root
        for c in word {
            if ptr.next[c] == nil { ptr.next[c] = TrieNode() }
            ptr = ptr.next[c]!
        }
        ptr.word = word
    }
    
    // time: O(MN * 4^L): M rows, N cols, word length L
    // space: O(KL): K words, each length W
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        guard board.count > 0 && board[0].count > 0 else { return [] }
        var board = board
        let rows = board.count, cols = board[0].count
        
        for word in words { insert(word) }
        
        var res = [String]()
        for y in 0..<rows {
            for x in 0..<cols {
                dfs(&res, &board, rows, cols, y, x, root)
            }
        }
        return res
    }
    
    let dy = [-1,0,1,0]
    let dx = [0,1,0,-1]
    func dfs(_ res: inout [String], _ board: inout [[Character]], _ rows: Int, _ cols: Int, _ y: Int, _ x: Int, _ node: TrieNode) {
        if y < 0 || y >= rows || x < 0 || x >= cols || board[y][x] == "#" { return }
        guard let next = node.next[board[y][x]] else { return }
        if !next.word.isEmpty {
            res.append(next.word)
            next.word = ""
        }

        let c = board[y][x]
        board[y][x] = "#"
        for d in 0..<4 {
            dfs(&res, &board, rows, cols, y + dy[d], x + dx[d], next)
        }
        board[y][x] = c
    }
}
