//
//  Q126_WordLadderII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/28.
//

import Foundation

class WordLadderII {
    
    // Two ways BFS
    // time & space: O(NL), N: word list size, L: word length
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        let a = Int(Character("a").asciiValue!)
        let z = Int(Character("z").asciiValue!)
        
        var wordSet = Set<String>(wordList)
        if wordSet.remove(endWord) == nil { return [] }
        wordSet.remove(beginWord)
        
        var res = [[String]]()
        var reverse = false
        var head = [beginWord: [[beginWord]]], tail = [endWord: [[endWord]]]
        while !head.isEmpty && !tail.isEmpty && res.isEmpty {
            if head.count > tail.count { swap(&head, &tail); reverse = !reverse }
            
            var next = [String: [[String]]]()
            for (h, front) in head {
                var str = Array(h)
                for i in 0..<str.count {
                    let ch = str[i]
                    for c in a...z {
                        str[i] = Character(Unicode.Scalar(c)!)
                        let s = String(str)
                        if let back = tail[s] { merge(&res, front, back, reverse) }
                        if wordSet.contains(s) { merge(&(next[s, default: [[String]]()]), front, [[s]], reverse) }
                    }
                    str[i] = ch
                }
            }
            for (n, _) in next { wordSet.remove(n) }
            
            swap(&head, &next)
        }
        return res
    }
    
    func merge(_ res: inout [[String]], _ front: [[String]], _ back: [[String]], _ reverse: Bool) {
        if reverse { return merge(&res, back, front, !reverse) }
        for f in front {
            for b in back {
                res.append(f + b)
            }
        }
    }
}
