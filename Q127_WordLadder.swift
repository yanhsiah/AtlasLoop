//
//  Q127_WordLadder.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/28.
//

import Foundation

class WordLadder {
    
    // Two ways BFS
    // time & space: O(NL), N: word list size, L: word length
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let a = Int(Character("a").asciiValue!)
        let z = Int(Character("z").asciiValue!)
        
        var wordSet = Set<String>(wordList)
        if wordSet.remove(endWord) == nil { return 0 }
        wordSet.remove(beginWord)
        
        var step = 2
        var head: Set<String> = [beginWord], tail: Set<String> = [endWord]
        while !head.isEmpty && !tail.isEmpty {
            if head.count > tail.count { swap(&head, &tail) }
            
            var next = Set<String>()
            for h in head {
                var chs = Array(h)
                for i in 0..<chs.count {
                    let ch = chs[i]
                    for c in a...z {
                        chs[i] = Character(Unicode.Scalar(c)!)
                        let s = String(chs)
                        if tail.contains(s) { return step }
                        if wordSet.contains(s) { next.insert(s) }
                    }
                    chs[i] = ch
                }
            }
            for n in next { wordSet.remove(n) }

            swap(&head, &next)
            step += 1
        }
        return 0
    }
}
