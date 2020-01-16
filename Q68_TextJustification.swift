//
//  Q68_TextJustification.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2020/1/15.
//

import Foundation

class TextJustification {
    
    // time & space: O(NL)
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        let n = words.count
        var res = [String](), i = 0
        while i < n {
            // length
            var len = words[i].count, count = 1
            while i + count < n {
                let newLen = len + words[i + count].count
                if newLen > maxWidth - count { break }
                len = newLen
                count += 1
            }
            
            // string
            var line = words[i]
            var spaces = maxWidth - len, extra = 0, tail = spaces - (count - 1)
            if count > 1 {
                if i + count >= n {
                    spaces = 1
                } else {
                    extra = spaces % (count - 1)
                    spaces /= (count - 1)
                    tail = 0
                }
                for j in 1..<count {
                    line += String(repeating: " ", count: spaces + (j <= extra ? 1 : 0)) + words[i + j]
                }
            }
            res.append(line + String(repeating: " ", count: tail))
            i += count
        }
        return res
    }
}
