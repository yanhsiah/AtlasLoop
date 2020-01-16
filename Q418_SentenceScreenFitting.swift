//
//  Q418_SentenceScreenFitting.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/15.
//

import Foundation

class SentenceScreenFitting {
    func wordsTyping(_ sentence: [String], _ rows: Int, _ cols: Int) -> Int {
        
        // N: # sentences, L: max sentence length

        // time: O(NL + RL), space: O(NL)
        let s = Array(sentence.joined(separator: " ") + " "), len = s.count
        var start = 0
        for _ in 0..<rows {
            start += cols
            while start > 0 && s[start % len] != " "  { start -= 1 }
            start += 1
        }
        return start / len
        
        // time: O(R + NC), space: O(N)
        let n = sentence.count
        var wordCount = 0, cache = [Int](repeating: -1, count: n)
        for _ in 0..<rows {
            let key = wordCount % n
            if cache[key] != -1 {
                wordCount += cache[key]
            } else {
                let prevWordCount = wordCount
                var spaces = cols
                spaces -= sentence[wordCount % n].count
                if spaces < 0 { return 0 }
                wordCount += 1
                while true {
                    spaces -= (1 + sentence[wordCount % n].count)
                    if spaces < 0 { break }
                    wordCount += 1
                }
                cache[key] = wordCount - prevWordCount
            }
        }
        return wordCount / n
    }
}
