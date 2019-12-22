//
//  Q140_WordBreakII.swift
//  AtlasLoop
//
//  Created by 黃彥翔 on 2019/12/22.
//

import Foundation

class WordBreakII {
    // time & space: O(N^2 * W)
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        return dfs(Array(s), Set<String>(wordDict), 0))
    }

    var cache = [Int: [String]]()
    func dfs(_ s: [Character], _ words: Set<String>, _ start: Int) -> [String] {
        if start == s.count { return [""] }
        if let res = cache[start] { return res }
        var res = [String]()
        for len in 1...s.count-start {
            let ss = String(s[start..<start+len])
            if words.contains(ss) {
                let tokens = dfs(s, words, start+len)
                for token in tokens {
                    res.append(token.isEmpty ? ss : "\(ss) \(token)")
                }
            }
        }
        cache[start] = res
        return res
    }
}
